Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA9440DFCD;
	Fri, 17 Apr 2026 12:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776429037; cv=none; b=t+I0GsVAx0M+XoVRT2mXYawYxLHfN8aGMI1NifgXtrJlEvcXC/MhH0DNxFjXLc81wupFSxq4o0zzrjA1ZvmiCR+1Mi/cGO05D7XpV+aL/EI/qD8pt2mur6gfEtIB6XhGai5/fkqUMtiOxenJYU1FvD3MrakwZPDnycWDTbhkApQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776429037; c=relaxed/simple;
	bh=nMyMR9xnTunoJmhz+upy+A+az7Geu7EY/3hPQmlD6ac=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=Fl+k9QpKwWkvvROZLDDNK/NLVZt2DMPCtRVWj9OSBOYkzy0Rwhs8u8+GLGuwtfq5ONIZHgdKXaLvcHUbZlE3T8Aqblq6lbiB27ENDXPuitZyLNGmB/xpd25Dv+Vd8rcUOUye1nOzQl9ZfqYXOvrLsbRRklao7Vu4u6oNk6in/q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TYl2RQtE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TYl2RQtE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2057DC19425;
	Fri, 17 Apr 2026 12:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776429036;
	bh=nMyMR9xnTunoJmhz+upy+A+az7Geu7EY/3hPQmlD6ac=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=TYl2RQtEgCvUKENjL9SrlglFDcP+SCpLywVFyQvw0VosJWCNGCItHYJ+wisE0CMyx
	 zr/zim8UIwT6GTnfIOKMlUBKOIUg+IJtGwlD/fxG/Swrmv5ydkRSSGjOI3mRyowgUv
	 cBwBckOsy7FI1tJrXHtQWdr3bTO0MAiFjJNth6PRy1ZAnl0lyImn1OiJXxA5JULw7N
	 jBKB1gt5dfYcSa+CcC4QZxXGJI/3eNMUPqgonvd+lJLmkDRUnv/X+6bknaf2YkhNf1
	 ukUoI8Hsp4dr8OkdiURiWwRSbKSLkNp4I+hbbNA7H0sJ4ODXMKZWxPAuoST8iTT0Ae
	 VN6Db2sQUvbWQ==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 17 Apr 2026 14:30:30 +0200
Message-Id: <DHVFJAHGWX8X.2DXC4BU5KZLG8@kernel.org>
Subject: Re: [PATCH v2 0/3] rust: add `bitfield!` macro
Cc: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, "John Hubbard"
 <jhubbard@nvidia.com>, "Alexandre Courbot" <acourbot@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, "Yury Norov" <yury.norov@gmail.com>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "David Airlie" <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, "Alistair Popple" <apopple@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <driver-core@lists.linux.dev>,
 <dri-devel@lists.freedesktop.org>
To: "Mark Brown" <broonie@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260409-bitfield-v2-0-23ac400071cb@nvidia.com>
 <798e83e6-eb7b-4502-85e7-5a0f6d9c6281@nvidia.com>
 <DHUXFAD38G5Y.6X6QNTANYNGH@kernel.org>
 <CANiq72k0FXcekxs=E+xLe3=wyu+KHr4yM0wLj1VgtgTUb_K4MQ@mail.gmail.com>
 <5a0b7de0-3bfe-4e71-9e0e-3d9396e1d9d5@sirena.org.uk>
In-Reply-To: <5a0b7de0-3bfe-4e71-9e0e-3d9396e1d9d5@sirena.org.uk>

On Fri Apr 17, 2026 at 12:59 PM CEST, Mark Brown wrote:
> Of course, nothing stops you maintaining a branch which isn't in -next
> and is open all the time and that won't have any wider impact.

This is exactly what's going to happen, please see [1].

Thanks,
Danilo

[1] https://lore.kernel.org/lkml/DHVEWDBHYKQF.XBXZ704CMXCF@kernel.org/
