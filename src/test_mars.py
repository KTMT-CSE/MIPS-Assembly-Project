from utils import run_mars

program_file = "main.s"

def test_001():
    inputs = [3, 5]

    assert "Ket qua a + b = 8" in run_mars(program_file, inputs)

def test_002():
    inputs = [-2, 7]

    assert "Ket qua a + b = 5" in run_mars(program_file, inputs)
