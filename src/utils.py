# utils.py
import subprocess

def run_mars(program_file: str, inputs: list[str]) -> str:
    """
    Chạy Mars45.jar với file MIPS và trả về output.
    :param program_file: đường dẫn file .s
    :param inputs: danh sách các input (a, b, ...)
    :return: output stdout dưới dạng string
    """
    process = subprocess.Popen(
        ["java", "-jar", "../Mars45.jar", "nc", program_file],
        stdin=subprocess.PIPE,
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
        text=True
    )

    input_str = "\n".join(str(i) for i in inputs) + "\n"
    stdout, stderr = process.communicate(input_str)

    if stderr:
        raise RuntimeError(f"Error running Mars: {stderr}")

    return stdout
