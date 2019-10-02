<?xml version='1.0' encoding='UTF-8'?>
<ReportSchemaTransform gstVersion="31405" schemaRootName="report_rst" version="1.0" schemaFileName="a3_05_simple.rdd">
    <SelectDuplicateShift name="Reports">
        <Collection srcLabel="Report" src="Report" name="Report">
            <Collection srcLabel="OnEveryRow" src="OnEveryRow" name="OnEveryRow">
                <Field srcLabel="simple.simple_key" src="simple.simple_key" name="simple.simple_key" type="SMALLINT"/>
                <Field srcLabel="simple.simple_id" src="simple.simple_id" name="simple.simple_id" type="SMALLINT"/>
                <Field srcLabel="simple.simple_value" src="simple.simple_value" name="simple.simple_value" type="INTEGER"/>
            </Collection>
        </Collection>
        <Collection srcLabel="Report" src="Report" name="Report2">
            <Collection srcLabel="OnEveryRow" src="OnEveryRow" name="OnEveryRow">
                <Field srcLabel="simple.simple_key" src="simple.simple_key" name="simple.simple_key" type="SMALLINT"/>
                <Field srcLabel="simple.simple_id" src="simple.simple_id" name="simple.simple_id" type="SMALLINT"/>
                <Field srcLabel="simple.simple_value" src="simple.simple_value" name="simple.simple_value" type="INTEGER"/>
            </Collection>
        </Collection>
    </SelectDuplicateShift>
    <Grouping>
        <Collection path="/Reports/Report" collectionItemName="OnEveryRow">
            <GroupBy expression="simple.simple_id" name="simple.simple_id">
                <input-variable xmlns="http://www.4js.com/2004/RTL" name="simple.simple_id" type="FGLNumeric"/>
            </GroupBy>
        </Collection>
    </Grouping>
    <Aggregations>
        <Aggregation expression="simple.simple_value" path="/Reports/Report/simple.simple_id/OnEveryRow" name="simple.simple_value" rule="Sum">
            <input-variable xmlns="http://www.4js.com/2004/RTL" name="simple.simple_value" type="FGLNumeric"/>
        </Aggregation>
        <Aggregation expression="simple.simple_value" path="/Reports/Report2/OnEveryRow" name="simple.simple_value2" rule="Sum">
            <input-variable xmlns="http://www.4js.com/2004/RTL" name="simple.simple_value" type="FGLNumeric"/>
        </Aggregation>
    </Aggregations>
</ReportSchemaTransform>
