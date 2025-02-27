from flask import Flask, render_template

app = Flask(__name__)

course_content = [
    {
        "title": "Fundamentals of Verilog HDL",
        "subtopics": [
            "Introduction to Verilog",
            "Simulation & Synthesis",
            "Basic Digital Design Projects"
        ]
    },
    {
        "title": "Intermediate Verilog Design",
        "subtopics": [
            "Combinational Circuits",
            "Sequential Circuits",
            "FSM Design & Implementation",
            "Memory Design",
            "Intermediate Design Projects"
        ]
    },
    {
        "title": "Advanced Verilog Design & FPGA Implementation",
        "subtopics": [
            "FPGA Development & Implementation",
            "High-Level Verilog Coding Techniques",
            "Hardware Verification & Testbenches",
            "Advanced FPGA Projects"
        ]
    },
    {
        "title": "ASIC Design & Verification",
        "subtopics": [
            "ASIC Design Flow",
            "FPGA vs. ASIC Implementation",
            "Advanced Verification Techniques",
            "Industry-Oriented Projects"
        ]
    },
    {
        "title": "Capstone Projects & Industry Readiness",
        "subtopics": [
            "Large-Scale Verilog Design Projects",
            "Industry Standards & Best Practices",
            "Tools & Certifications"
        ]
    }
]

@app.route('/')
def index():
    return render_template('index.html', course_content=course_content)

if __name__ == '__main__':
    app.run(debug=True)
