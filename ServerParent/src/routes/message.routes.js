const express = require("express");
const router = express.Router();
const messageController = require("../controllers/message.controller");
const authMiddleware = require("../middlewares/auth.middleware");

router.post("/", authMiddleware, messageController.envoyer);

router.get("/:id", authMiddleware, messageController.messagesUtilisateur);

module.exports = router;