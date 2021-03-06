#import "EMField.h"
#import "NSObject+ObjectOrNil.h"
#import "NSNumber+ObjectIDString.h"

EMFieldType EMFieldTypeFromString(NSString *fieldTypeString) {
    if ([fieldTypeString isEqual:@"text"])
        return EMFieldTypeText;
    else if ([fieldTypeString isEqual:@"text[]"])
        return EMFieldTypeTextArray;
    else if ([fieldTypeString isEqual:@"date"])
        return EMFieldTypeDate;
    else if ([fieldTypeString isEqual:@"timestamp"])
        return EMFieldTypeTimestamp;
    else if ([fieldTypeString isEqual:@"numeric"])
        return EMFieldTypeNumeric;
    else if ([fieldTypeString isEqual:@"boolean"])
        return EMFieldTypeBoolean;
    else
        NSLog(@"-[Field initWithDictionary]: encountered unknown field type '%@'", fieldTypeString);
    return -1;
}

NSString *EMFieldTypeToString(EMFieldType type) {
    if (type == EMFieldTypeText)
        return @"text";
    else if (type == EMFieldTypeTextArray)
        return @"text[]";
    else if (type == EMFieldTypeDate)
        return @"date";
    else if (type == EMFieldTypeTimestamp)
        return @"timestamp";
    else if (type == EMFieldTypeNumeric)
        return @"numeric";
    else if (type == EMFieldTypeBoolean)
        return @"boolean";
    else
        NSLog(@"-[Field initWithDictionary]: encountered unknown field type '%i'", type);
    return nil;
}

EMFieldWidgetType EMFieldWidgetTypeFromString(NSString *widgetTypeString) {
    if ([widgetTypeString isEqual:@"text"])
        return EMFieldWidgetTypeText;
    else if ([widgetTypeString isEqual:@"long"])
        return EMFieldWidgetTypeLong;
    else if ([widgetTypeString isEqual:@"check_multiple"])
        return EMFieldWidgetTypeCheckMultiple;
    else if ([widgetTypeString isEqual:@"radio"])
        return EMFieldWidgetTypeRadio;
    else if ([widgetTypeString isEqual:@"select one"])
        return EMFieldWidgetTypeSelectOne;
    else if ([widgetTypeString isEqual:@"select multiple"])
        return EMFieldWidgetTypeSelectMultiple;
    else if ([widgetTypeString isEqual:@"date"])
        return EMFieldWidgetTypeDate;
    else
        NSLog(@"-[Field initWithDictionary]: encountered unknown widget type '%@'", widgetTypeString);
    return -1;
}

NSString *EMFieldWidgetTypeToString(EMFieldWidgetType type) {
    if (type == EMFieldWidgetTypeText)
        return @"text";
    else if (type == EMFieldWidgetTypeLong)
        return @"long";
    else if (type == EMFieldWidgetTypeCheckMultiple)
        return @"check_multiple";
    else if (type == EMFieldWidgetTypeRadio)
        return @"radio";
    else if (type == EMFieldWidgetTypeSelectOne)
        return @"select one";
    else if (type == EMFieldWidgetTypeSelectMultiple)
        return @"select multiple";
    else if (type == EMFieldWidgetTypeDate)
        return @"date";
    else
        NSLog(@"-[Field initWithDictionary]: encountered unknown field type '%i'", type);
    return nil;
}

@implementation EMField

- (id)initWithDictionary:(NSDictionary *)dict {
    if ((self = [super init])) {
        _fieldID = [[[dict objectForKey:@"field_id"] numberOrNil] objectIDStringValue];
        _name = [[[dict objectForKey:@"shortcut_name"] stringOrNil] copy];
        _displayName = [[[dict objectForKey:@"display_name"] stringOrNil] copy];
        
        NSString *fieldTypeString = [[dict objectForKey:@"field_type"] stringOrNil];
        
        _fieldType = EMFieldTypeFromString(fieldTypeString);
        
        NSString *widgetTypeString = [[dict objectForKey:@"widget_type"] stringOrNil];
        
        _widgetType = EMFieldWidgetTypeFromString(widgetTypeString);
        
        _options = [[dict objectForKey:@"options"] arrayOrNil];
        
        _columnOrder = [[[dict objectForKey:@"column_order"] numberOrNil] intValue];
    }
    return self;
}

- (NSDictionary *)dictionaryRepresentation
{
    return @{
    @"shortcut_name" : ObjectOrNull(_name),
    @"display_name" : ObjectOrNull(_displayName),
    @"field_type" : ObjectOrNull(EMFieldTypeToString(_fieldType)),
    @"widget_type" : ObjectOrNull(EMFieldWidgetTypeToString(_widgetType)),
    @"column_order" : @(_columnOrder)
    };
}

@end
