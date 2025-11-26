#Chạy phiên bản python 3.12
from Crypto.PublicKey import RSA

key = RSA.generate(2048)

private_key = key.export_key()
public_key = key.publickey().export_key()

open("private.pem", "wb").write(private_key)
open("public.pem", "wb").write(public_key)
