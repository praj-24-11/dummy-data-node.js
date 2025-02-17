const express = require('express');
const router = express.Router();
const sudokuController = require('../controllers/sudokuController');

// Route to get Sudoku puzzle
router.get('/puzzle', sudokuController.getPuzzle);

// Route to solve Sudoku puzzle
router.post('/solve', sudokuController.solvePuzzle);

module.exports = router;
