from fastapi import FastAPI
import json

stockedJsonFilePath = "stocked.json"

app = FastAPI()

@app.get("/")
def root():
    return {"How are you ":" Seeing this"}

@app.post("/stocked")
def returnStocked():

    stockedSeeds = []

    with open(stockedJsonFilePath, "r") as f:
        content = f.read()
        parsedContent = json.loads(content)

        for SeedName in parsedContent:
            StockedSeed = parsedContent[SeedName]
            if StockedSeed:
                stockedSeeds.append(SeedName)

        return stockedSeeds       
    
    return []
