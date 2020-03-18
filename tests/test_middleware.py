from uuid import uuid4

import pytest
from aiohttp import web

from belvaio_request_id.middleware import request_id_middleware


async def test_view(request):
    return web.json_response({"test": "ok"})


@pytest.fixture
def cli(loop, aiohttp_client):
    app = web.Application(middlewares=[request_id_middleware])
    app.router.add_get("/", test_view)
    return loop.run_until_complete(aiohttp_client(app))


async def test_request_id_middleware(cli):
    request_id = uuid4().hex
    response = await cli.get("/", headers={"X-Request-Id": request_id})
    assert response.status == 200
    assert await response.json() == {"test": "ok"}
    assert response.headers["X-Request-Id"] == request_id
