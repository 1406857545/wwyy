from flask import Flask, jsonify, request

app = Flask(__name__)

# 简单的内存存储示例（仅用于演示）
items = {}


@app.route('/')
def index():
    return 'Hello Flask (backend)'


@app.route('/items/<item_id>', methods=['GET'])
def get_item(item_id):
    item = items.get(item_id)
    if item is None:
        return jsonify({'error': 'not found'}), 404
    return jsonify({'item_id': item_id, 'value': item})


@app.route('/items/<item_id>', methods=['POST'])
def create_item(item_id):
    data = request.get_json(silent=True) or {}
    value = data.get('value')
    if value is None:
        return jsonify({'error': 'missing value'}), 400
    items[item_id] = value
    return jsonify({'item_id': item_id, 'value': value}), 201


if __name__ == '__main__':
    # 开发模式，仅用于本地测试。生产请使用 WSGI/ASGI 服务器。
    app.run(host='0.0.0.0', port=8000, debug=True)
