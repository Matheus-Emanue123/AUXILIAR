import csv

# Open the input file
with open('resultados.csv', 'r') as input_file:
    reader = csv.reader(input_file)
    header = next(reader)  # Skip the header

    # Initialize the writers dictionary
    writers = {}

    # Process the rows
    for row in reader:
        function = row[0]  # Replace with the correct index
        state = row[1]  # Replace with the correct index

        # Check if the writer exists, if not create it
        if f'Resultados{function}{state}.csv' not in writers:
            writers[f'Resultados{function}{state}.csv'] = csv.writer(open(f'Resultados{function}{state}.csv', 'w'))

        # Write the row to the appropriate CSV file
        writers[f'Resultados{function}{state}.csv'].writerow(row)