CREATE FUNCTION java_call_handler()  RETURNS language_handler AS 'pljava' LANGUAGE C;
CREATE FUNCTION javau_call_handler() RETURNS language_handler AS 'pljava' LANGUAGE C;
CREATE TRUSTED LANGUAGE java HANDLER java_call_handler;
CREATE LANGUAGE javaU HANDLER javau_call_handler;