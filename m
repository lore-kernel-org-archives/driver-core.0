Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.216
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794409108;
	b=jMepIU7U9I5RJs/sZWas2afw+I9FZlc5edQ3Dn9x3jUuxYm4SgtJrGQgjMqXT7R6RGav
	 3dnnTFm6pkkYQuwXMaXFExsPlja3IUWMuVOwhOURQF8DA/n8nOReq1wwarMU4edXIawxa
	 K65K9qq0/WhSfyN7htMLsQN+gEDi6QXGoiqkUoaZiNGJiTtcTgbfQuu1GsjSy6RPcwoaG
	 LZvjY9rnDYOa5x7Hy4LBvdBi5i70nZh86ZRAfRvDII+rm6Mn7AeuzPB/az3eez/uKOv+3
	 aZBji7aykzRwCWmrmMZ9MAyFUhPekWECALLZxQN0QnSGVcVZ3c0St22h0XA/jh7YsBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794409108;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 MIME-Version;
	bh=byL/9IM6xgjdPi5Ss/cz8AdXkgWexIzqBw9kg9a3atE=;
	b=4kVwFGaMD5VPP25iUbI5MxO31wqST9OpoxM17D221Zc5iKXm+SSLLI7GHfkq5KuZcqql
	 cQWXnB8XCdq3rnxQO+YVySX3P1BhKFbGzAyV090IupQ8zgnYHavtJW1c8ITT3o6J35oYm
	 zwzJkAyzMTw6uIJ2eUr7UY9l8sUUJn4Fixkxcd5Ww0ifpcEYzeWsWCiTeoFOrTOLWBLEq
	 6EFrdHJYNv/WfusaDbBnDfueYcRIbWSVDDZr3eoQdv1SU8IHg3xHR7e1QTr75xFjB+O/7
	 5J/JGASXVwVDmPKl5++eqEfwGYfA8Z8AKh5vg7PREBQCaRBNEnwpD11uaA0S0yZBFnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=D5OLBuUX;
	arc=none smtp.remote-ip=91.218.175.216
Received: from mta0.migadu.com (out-216.mta0.migadu.com [91.218.175.216])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B6BA606A8B1
	for <driver-core@lists.linux.dev>; Wed, 11 Nov 2026 14:58:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B6BA606A8B1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=D5OLBuUX
X-Envelope-To: driver-core@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=byL/9IM6xgjdPi5Ss/cz8AdXkgWexIzqBw9kg9a3atE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794409106; v=1; x=1795013906;
 b=D5OLBuUXixcJNA3wq+w6klYYPciWED0PbZqilIweuf3CMBINVxZbzuZCFmQKIv+tXdVt8YXM
 Dffrd8zOxjF3fZtb7QNusP9iX5ZLEksSYQcvx6FsryJiZz2vU0QggwIoE1TGCn0QXgfi5uilw8g
 ZB9KDMBgF797dexgX8cnITp8=
X-Envelope-To: driver-core@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 36196609946a065f;
	Wed, 11 Nov 2026 14:58:08 +0000
X-Mizu-Trace-ID: 36196609946a065f
X-Migadu-Flow: FLOW_OUT
From: Igor Korotin <igor.korotin@linux.dev>
To: Muchamad Coirul Anwar <muchamadcoirulanwar@gmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>,
 Alice Ryhl <aliceryhl@google.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Mark Brown <broonie@kernel.org>,
 Brandon StJohn <branstj@gmail.com>, linux-iio@vger.kernel.org,
 linux-i2c@vger.kernel.org, rust-for-linux@vger.kernel.org,
 driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v6 0/4] iio: position: add Rust driver for ams AS5600
Date: Wed, 11 Nov 2026 14:58:08 +0000
Message-ID: <179440908805.1963.3189482737225975976@linux.dev>
In-Reply-To:
 <CAO26r3RofEz-YCnaUfTTb+7phdEzUqG5iwVObuho_EgW5Ep44Q@mail.gmail.com>
References: <20261016154819.17936-1-muchamadcoirulanwar@gmail.com>
 <CAO26r3RofEz-YCnaUfTTb+7phdEzUqG5iwVObuho_EgW5Ep44Q@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

Hi Coirul,

Sorry for the slow reply. Co-developed-by/Signed-off-by is fine with me
-- your call either way, I don't mind.

Cheers
Igor
