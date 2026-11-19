Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.161
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795073228;
	b=dMqLksfk5X2TfQ7RcErYxYit8V458dqDimCkQ8EPP+XnSb9iK444GC6xPJXZEh434WaP
	 9gmGFPeXj8obZUR/Isl9xQTQrz18ni1+GbssAHFFx+gH46YeUEFHYnOQ4mrYCTS4ewzhz
	 4YTM3pziKWG3cAtI5kP2CGC5B6jWJcv9COdQvcPPRFnU6kT/ezoPGH6Kbx/xs61QC9j9M
	 QJ/Bvr+exbzdaPzVle+ulTJFBfb2bYPkW3E//3Oh3h7MznTonRbEUXnCG3SzNBODrDtcB
	 rKJWG07CdQO1ar03eUtwffUVfjT3m2KCiZ6Hmuf+Y2cKitc5Vrxo0IuUoBYalexcHLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795073228;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:
	 Reply-To:To:Cc:Date:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version:X-MBO-RS-ID:
	 X-MBO-RS-META;
	bh=LHec+bcorVdFivY0AsqfT4qwBXwZIOqFaXBbhEon4Rk=;
	b=ts8qU5sIkKBt4ff1hVFjK1BtXvA36iPpLZKVUpl/AL6zxwS112DvQYqwZJqpC7o9XqWd
	 zEnyvBGZF9Dq6ixJrUl3zMiV2QsyHX0gueZoBKMVqOstoRMWk0JqDI/qEF3Zh9ruPYg9G
	 mR7NIOWr6yYJaoSUtw63i26+RqlH65Si7CGSv+a1izJ2WEDGWJLveH6alLuq531UuSK6N
	 zn7Ss1AdareP5LYlHCAHwgdniUBYJQpayJZII66Qf+mA+DYlSaEpSBWgIvEWyGuAXiX6f
	 1ijSI+EWgi4KIbH1BgdWE1lsPeIJyxdMxphbvanjamJAhtnOXrihUvOeZE5c3uEzQzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mailbox.org;
	spf=pass smtp.mailfrom=mailbox.org;
	dkim=pass header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b="v2aBK9/u";
	arc=none smtp.remote-ip=80.241.56.161
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08221606A320;
	Thu, 19 Nov 2026 07:27:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08221606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=v2aBK9/u
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4jVVQw4Vt0zKp42;
	Thu, 19 Nov 2026 08:27:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1795073224; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LHec+bcorVdFivY0AsqfT4qwBXwZIOqFaXBbhEon4Rk=;
	b=v2aBK9/uSUt79zZCB478wuJ7j8gMDI0lhc06QOm0ironoWz+tfGmwGfZRbxil4WGLiskbO
	SSyhHHqRxefOKRvNmUzKwJsccz/0Jy8MZo850+0WarJZNu2u7T9VOdYmS4EPuOeFX1/1xF
	+sCj0qdmwVJsXy4AruDvqgeVeOmBoBqjMP76J+EV6FeclGEFxzRSF4W1VMdqTjmo6Pq756
	2uOe9ALPOgg3AoqA/rCxb08uvT6JxgidOQBHqBP/bOJfHngzTm5FzggLHBkL3DvBai/Pqa
	00VpEiiWGBvBUAi/I0+AhpDv7CcVrOU2jDNfrS4gMX50rTg6Ck+b7f5GdDMSHg==
Message-ID: <7aa027e3ff479118c30828d77f7d348f611b7ea1.camel@mailbox.org>
Subject: Re: [PATCH 2/2] gpu: nova-core: remove unnecessary firmware pin-init
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Danilo Krummrich <dakr@kernel.org>, acourbot@nvidia.com, 
	aliceryhl@google.com, abdiel.janulgue@gmail.com,
 daniel.almeida@collabora.com, 	robin.murphy@arm.com, a.hindborg@kernel.org,
 ojeda@kernel.org, boqun@kernel.org, 	gary@garyguo.net,
 bjorn3_gh@protonmail.com, lossin@kernel.org, tmgross@umich.edu, 
	tamird@kernel.org, work@onurozkan.dev
Cc: driver-core@lists.linux.dev, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Date: Thu, 19 Nov 2026 08:27:00 +0100
In-Reply-To: <20261114234324.82387-2-dakr@kernel.org>
References: <20261114234324.82387-1-dakr@kernel.org>
	 <20261114234324.82387-2-dakr@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-3.fc44) 
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MBO-RS-ID: 5aac85ed30d7b19f367
X-MBO-RS-META: 5nofx34a7of1nrrc8mapextogthzndoy

On Sun, 2026-11-15 at 00:42 +0100, Danilo Krummrich wrote:
> Now that SGTable no longer requires pinning, remove the pin-init
> machinery from Radix3 and GspFirmware.
>=20
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Philipp Stanner <phasta@kernel.org>
