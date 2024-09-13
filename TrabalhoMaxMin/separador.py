import csv
import os

# Create directories for the output files
os.makedirs('PorFuncaoEstado', exist_ok=True)
os.makedirs('PorFuncaoVetor', exist_ok=True)

# Open the input file
with open('resultados.csv', 'r') as input_file:
    reader = csv.reader(input_file)
    header = next(reader)  # Skip the header

    # Initialize the writers dictionary
    writers_funcao_estado = {}
    writers_funcao_vetor = {}

    # Process the rows
    for row in reader:
        funcao = row[0]
        vetor = row[1]
        estado = row[4]

        # Create file for each combination of Função and Estado
        file_name_funcao_estado = f'PorFuncaoEstado/Resultados_{funcao}_{estado}.csv'
        if file_name_funcao_estado not in writers_funcao_estado:
            writers_funcao_estado[file_name_funcao_estado] = csv.writer(open(file_name_funcao_estado, 'w', newline=''))
            writers_funcao_estado[file_name_funcao_estado].writerow(header)  # Write the header

        writers_funcao_estado[file_name_funcao_estado].writerow(row)

        # Create file for each combination of Função and Vetor
        file_name_funcao_vetor = f'PorFuncaoVetor/Resultados_{funcao}_Vetor{vetor}.csv'
        if file_name_funcao_vetor not in writers_funcao_vetor:
            writers_funcao_vetor[file_name_funcao_vetor] = csv.writer(open(file_name_funcao_vetor, 'w', newline=''))
            writers_funcao_vetor[file_name_funcao_vetor].writerow(header)  # Write the header

        writers_funcao_vetor[file_name_funcao_vetor].writerow(row)