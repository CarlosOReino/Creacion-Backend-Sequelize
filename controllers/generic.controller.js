export default {
    getInit: (req, res) => {
        console.log("req.params: " + JSON.stringify(req.params));
        res.end("req.query.q: " + JSON.stringify(req.query));
    }
}