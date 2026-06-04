const express = require("express");
const router = express.Router();
const annonceController = require("../controllers/annonce.controller");
const authMiddleware = require("../middlewares/auth.middleware");

router.get("/", authMiddleware, annonceController.getAll);

router.post("/", authMiddleware, annonceController.create);

module.exports = router;