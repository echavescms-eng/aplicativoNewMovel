import json
import base64

# Data preparation
labels = ["Year 1", "Year 2", "Year 3"]

# Raw values in thousands of BRL (as requested)
# Year 1: Dual-Native = 850, Cross-Platform = 500
# Year 2: Dual-Native = 400, Cross-Platform = 220
# Year 3: Dual-Native = 450, Cross-Platform = 240
dual_native_data = [850, 400, 450]
cross_platform_data = [220, 220, 240] # Wait, prompt text says Year 2 CP = 220, Year 3 CP = 240

chart_data = {
    "metadata": {
        "chart_type": "bar",
        "chart_title": "3-Year Architecture TCO Projection (Values in BRL Thousands)",
        "orientation": "vertical",
        "stacking": "grouped",
        "x_axis_title": "Projection Period",
        "y_axis_title": "Cost (R$ Thousands)",
        "unit_symbol": "R$ ",
        "unit_position": "prefix",
        "value_tiers": [
            {"min": 1, "divide_by": 1, "suffix": "K"}
        ],
        "scale_type": "linear"
    },
    "labels": labels,
    "datasets": [
        {
            "label": "Dual-Native (Swift + Kotlin)",
            "axis": "primary",
            "data": [
                {"value_raw": 850, "tooltip_text": "Dual-Native Year 1: R$ 850K"},
                {"value_raw": 400, "tooltip_text": "Dual-Native Year 2: R$ 400K"},
                {"value_raw": 450, "tooltip_text": "Dual-Native Year 3: R$ 450K"}
            ]
        },
        {
            "label": "Cross-Platform (Single-Code)",
            "axis": "primary",
            "data": [
                {"value_raw": 500, "tooltip_text": "Cross-Platform Year 1: R$ 500K"},
                {"value_raw": 220, "tooltip_text": "Cross-Platform Year 2: R$ 220K"},
                {"value_raw": 240, "tooltip_text": "Cross-Platform Year 3: R$ 240K"}
            ]
        }
    ]
}

spec_str = json.dumps(chart_data).encode('utf-8')
print(f'chartjs_spec: "{base64.b64encode(spec_str).decode("utf-8")}"')
