Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C59F369D67;
	Thu, 25 Jun 2026 21:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782422674; cv=none; b=oHersBXXiwJSPt9WMsQnWBUDQvWOeSAtXBNiH0BoM/j5OJ8t6lsTyp6VohQJFbI9L59ysDPpM2wz0YI2AsR80hH9TicTDZYf9oW90pLNOCkm4CTUjAS5c3kLd1bVeRU7XBR4SUcSdYdsv0wLS1+EMCiJfoCeMRkseDpTWAhzwZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782422674; c=relaxed/simple;
	bh=uDposd9yzkD1FM2nIjNn4bXbkvDLt/YZv/vRKxkPZLs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=piWWv5pX/bhlHvPm4P4hfEFtDKD+0XIO5eLN5hK+Kq42cbd3DK1PpPlUwWKj2HycdYijrvNrQN9BBIPro07i7ixF+1+JleNTMQ4zV02HZmIEb/9QB9DfMt9NQHLV7WbwZ0v97cFn+fnmfI9mi3xYJavkdiXEZZ95V5Hhzzy8LcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Onrh2DRe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Onrh2DRe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0974B1F00A3A;
	Thu, 25 Jun 2026 21:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782422672;
	bh=uDposd9yzkD1FM2nIjNn4bXbkvDLt/YZv/vRKxkPZLs=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=Onrh2DRe3etG8+gEtrOVtB/xO9K2Pc6B/OJAfHyrypQjzi1uaCgLLM4uBlOd7FW6g
	 +8nmPgwFJIlj3/hINrovtvarjjqIFLBUDc0ldxhclyhwr3FDdvSwwk6A3kw98zSTQC
	 zb6N+Qsg3G3JxkHZIYp6Uaex6pAzzAOIme2FMm4JdOWFKP6nGDs1W1yZDwHIsnGfqt
	 KU25U8mQYcZHwblmMjMKq33uNEgpC43OlAxlei9c0DCz/OjaboMv7swe2MqQn3+TJt
	 kMLlhvw4pzTRFQNXVLHpIdbhp36vwVMuArLhNV+9TSOGEQQJKG741dIWsVKn7Lxd7C
	 8xdMhUH91Z//Q==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 25 Jun 2026 23:24:26 +0200
Message-Id: <DJIG3OW4RS98.3R1C3C97X702N@kernel.org>
Subject: Re: [PATCH v21 4/4] rust: drm: gem: Introduce
 shmem::Object::sg_table()
Cc: <dri-devel@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, "Alexandre Courbot" <acourbot@nvidia.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, <driver-core@lists.linux.dev>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Alice Ryhl" <aliceryhl@google.com>,
 "Simona Vetter" <simona@ffwll.ch>, <linux-kernel@vger.kernel.org>, "Sumit
 Semwal" <sumit.semwal@linaro.org>, <linux-media@vger.kernel.org>, "Rafael J
 . Wysocki" <rafael@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>,
 "Maxime Ripard" <mripard@kernel.org>, "David Airlie" <airlied@gmail.com>,
 "Benno Lossin" <lossin@kernel.org>, <linaro-mm-sig@lists.linaro.org>,
 "Mukesh Kumar Chaurasiya" <mkchauras@gmail.com>, "Asahi Lina"
 <lina+kernel@asahilina.net>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>
To: "Lyude Paul" <lyude@redhat.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260612194436.585385-1-lyude@redhat.com>
 <20260612194436.585385-5-lyude@redhat.com>
In-Reply-To: <20260612194436.585385-5-lyude@redhat.com>

On Fri Jun 12, 2026 at 9:43 PM CEST, Lyude Paul wrote:
> In order to do this, we need to be careful to ensure that any interface w=
e
> expose for scatterlists ensures that any mappings created from one are
> destroyed on driver-unbind. To do this, we introduce a Devres resource in=
to
> shmem::Object that we use in order to ensure that we release any SGTable
> mappings on driver-unbind.

It seems that this patch was applied without also applying the prerequisite
patch (patch 3), which broke the build for the newly added kunit test -- I'=
ve
picked up prerequisite patch to resolve this.

Thanks,
Danilo
