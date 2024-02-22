import requests

print("Hello From Python Script", flush=True)

target_url = "latest/api/token"
headers = {
    'X-aws-ec2-metadata-token-ttl-seconds': '21600'
}

r = requests.put(f"http://127.0.0.1:8080/{target_url}", headers=headers)
token = r.text

print(f"Here is the token {token}", flush=True)
