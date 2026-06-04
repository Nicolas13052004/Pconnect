const express = require("express");
const router = express.Router();
const absenceController = require("../controllers/absence.controller");
const authMiddleware = require("../middlewares/auth.middleware");

router.post("/", authMiddleware, absenceController.create);

router.get("/eleve/:id", authMiddleware, absenceController.getByEleve);

module.exports = router;