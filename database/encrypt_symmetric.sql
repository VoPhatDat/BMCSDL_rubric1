--Create orr repplace function encrypt AES
CREATE OR REPLACE FUNCTION encrypt_aes(p_text VARCHAR2)
RETURN RAW 
AS 
  v_key RAW(32) := UTL_RAW.CAST_TO_RAW('12345678901234567890123456789012'); --12345678901234567890123456789012 is secret key
BEGIN
    RETURN DBMS_CRYPTO.ENCRYPT(
               UTL_RAW.CAST_TO_RAW(p_text),
               DBMS_CRYPTO.AES_CBC_PKCS5,
               v_key
           );
END;

CREATE OR REPLACE FUNCTION decrypt_aes(p_raw RAW)
RETURN VARCHAR2
AS
    v_key RAW(32) := UTL_RAW.CAST_TO_RAW('12345678901234567890123456789012');
    v_out RAW(2000);
BEGIN
    v_out := DBMS_CRYPTO.DECRYPT(
                 p_raw,
                 DBMS_CRYPTO.AES_CBC_PKCS5,
                 v_key
             );
    RETURN UTL_RAW.CAST_TO_VARCHAR2(v_out);
END;

--ADD NEW COLUMN FOR STATUS ENCRYPT
ALTER TABLE USERS ADD password_enc RAW(2000);

--UPDATE TABLE USERS 
UPDATE USERS
SET password_enc = encrypt_aes(password_raw);

SELECT * FROM USERS;