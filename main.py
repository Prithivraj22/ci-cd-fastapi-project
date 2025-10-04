from fastapi import FastAPI

app=FastAPI()

@app.get("/")
def read_root():
    return {"message":"V1 of my FastAPI app is running! (Deployed via CI/CD pipeline)"}