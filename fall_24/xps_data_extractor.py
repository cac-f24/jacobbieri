import pandas as pd

def format_data(file_path, sheet_name):
    df = pd.read_excel(file_path, sheet_name=sheet_name)
    elements = {} # Creating dicionary so that it's easier to separate elements
    current_element = None
    
    for index, row in df.iterrows():
        if row.isnull().all():
            continue
        left_value = row[0]
        right_value = row[1] if len(row) > 1 else None  # If the row is an element title, setting intensity to none
        if isinstance(left_value, str):
            if left_value == 'Full':
                continue
            else:
                current_element = left_value
                if current_element not in elements:
                    elements[current_element] = []
        elif pd.notna(left_value) and isinstance(left_value, (int, float)): # CHecking if the left column has a binding energy
            if current_element and pd.notna(right_value):  # Ensure intensity is not empty
                binding_energy = left_value
                intensity = right_value
                elements[current_element].append({'Binding Energy (eV)': binding_energy, 'Intensity': intensity})
    
    formatted_dfs = {element: pd.DataFrame(data) for element, data in elements.items()}
    return formatted_dfs