import axios from "axios"
import express from "express"

const app = express()
app.use("/img", express.static('./img'));
app.listen(3000, () => console.log("API OK at port 3000"))

const SD_ENDPOINT = process.env.SD_ENDPOINT || "http://auto:7860"
if(!SD_ENDPOINT) throw new Error("Endpoint not provided")

app.get("/generate",async (req, res) => {
    const prompt = req.query.prompt
    if(!prompt) {
        res.status(500).send("prompt not provided")
        return
    }
    const {data} = await axios.post(SD_ENDPOINT + "/run/predict/", reqBody(prompt))
    const url = data.data[0][0].name
    if(!url) {
        res.status(500).send("Internal Server Error")
        return
    }
    const imageRes = await axios.get(`${SD_ENDPOINT}/file=${url}`, {responseType: 'arraybuffer'});
    res.send(new Buffer.from(imageRes.data, 'binary').toString('base64'))
})



const reqBody = (data) => {
    return {
        "fn_index": 50,
        "data": [
            data, // prompt
            "", // negative prompt
            "None",
            "None",
            20,
            "Euler a", // sampling method
            false,
            false,
            1, // Batch count
            1, // Batch size
            7, // CFG scale
            -1,
            -1,
            0,
            0,
            0,
            false, 
            512, // width
            512, // height
            false,
            0.7,
            0,
            0,
            "None",
            "",
            false,
            false,
            false,
            "",
            "Seed",
            "",
            "Nothing",
            "",
            true,
            false,
            false,
            null,
            ""
        ]
    }
}