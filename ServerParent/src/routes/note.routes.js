const express = require("express");
const router = express.Router();
const noteController = require("../controllers/note.controller");
const authMiddleware = require("../middlewares/auth.middleware");

// enseignant seulement (plus tard role)
router.post("/", authMiddleware, noteController.create);

router.get("/eleve/:id", authMiddleware, noteController.getByEleve);

module.exports = router;