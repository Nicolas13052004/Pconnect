const express = require("express");
const router = express.Router();

const matiereController = require("../controllers/matiere.controller");
const authMiddleware = require("../middlewares/auth.middleware");
const roleMiddleware = require("../middlewares/role.middleware");

// ADMIN ONLY
router.post("/", authMiddleware, roleMiddleware("admin"), matiereController.create);
router.get("/", authMiddleware, matiereController.getAll);
router.get("/:id", authMiddleware, matiereController.getById);
router.put("/:id", authMiddleware, roleMiddleware("admin"), matiereController.update);
router.delete("/:id", authMiddleware, roleMiddleware("admin"), matiereController.remove);

module.exports = router;