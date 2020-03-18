from uuid import uuid4

import pytest

from belvaio_request_id.utils import get_request_id, set_request_id


@pytest.fixture
def uuid4_mock(mocker):
    request_id = uuid4().hex
    uuid4_mock = mocker.patch("belvaio_request_id.utils.uuid4")
    uuid4_mock.return_value.hex = request_id
    return request_id


def test_request_id_generated_and_saved_if_not_given(uuid4_mock):
    set_request_id()
    assert get_request_id() == uuid4_mock


def test_request_id_saved_if_given():
    request_id = uuid4().hex
    set_request_id(request_id)
    assert get_request_id() == request_id


def test_request_id_generated_if_bad_given(uuid4_mock, caplog):
    set_request_id("bad_request_id")
    assert get_request_id() == uuid4_mock
    assert "Received invalid request id" in caplog.text
