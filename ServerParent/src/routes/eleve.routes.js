const express = require("express");
const router = express.Router();

const eleveController = require("../controllers/eleve.controller");

const authMiddleware = require("../middlewares/auth.middleware");
const roleMiddleware = require("../middlewares/role.middleware");

// ADMIN ONLY → créer élève
router.post("/", authMiddleware, roleMiddleware("admin"), eleveController.create);

// accès lecture
router.get("/", authMiddleware, eleveController.getAll);
router.get("/:id", authMiddleware, eleveController.getById);

// admin update/delete
router.put("/:id", authMiddleware, roleMiddleware("admin"), eleveController.update);
router.delete("/:id", authMiddleware, roleMiddleware("admin"), eleveController.remove);

module.exports = router;