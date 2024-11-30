from flask import Flask, request, jsonify
import pandas as pd
import joblib
import json

app = Flask(__name__)
loaded_log = joblib.load('rfc_model.h5')

@app.route('/api/state', methods=['POST'])
def create_page():
    try:
        json_data = request.get_json()
        if not json_data:
            return jsonify({'error': 'No data found in request body'}), 400
        df = pd.DataFrame(json_data)
        label = loaded_log.predict(df)
        data = {'label': label.tolist()}
        return jsonify(data)
    except json.decoder.JSONDecodeError as e:
        return jsonify({'error': 'Malformed JSON data in request body'}), 400
    except Exception as e:
        return jsonify({'error': 'An unexpected error occurred'}), 500

if __name__ =='__main__':
    app.run(debug=True, port=8000)