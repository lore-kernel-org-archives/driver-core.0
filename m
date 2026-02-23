Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C15934AB1F
	for <driver-core@lists.linux.dev>; Mon, 23 Feb 2026 21:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771880413; cv=none; b=YCOmCJmi7nQh9h+sJtgYuQy11zbfAEK7nPDtBCMqFvKeykqCZKhP5l7Hv6/keRQeRXafY2o6ZKE/Y/vI74RmhBVsS1QM6bRS16oEqPk1ZcScKXI0YaPRl213PKevXAdJPejgT+UR+4Tu3CwYPb9vTw/Pji046id253h+BdoVKy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771880413; c=relaxed/simple;
	bh=aKIOPBEcPL7Dk1h/PGRlgq8uxS4h2Q3OebmeEXbtGrU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UXzrxBsVFW94Kxo7uj27Pq40X42nk+QtEV3eX9gzSyQd7xfYV4le27m0XP2hkgXE6O0ccKqlJeRhKQTlLPysCE2I6Ddltd2ZivuNGgwbEIx4FzxN17iIFHK4bw7iNEdv7flmV3/sWrQaN7xezhwajE85hOF9ifxxYNzn9Qlk6CE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dW+gRcDp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dW+gRcDp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A5C5C19421
	for <driver-core@lists.linux.dev>; Mon, 23 Feb 2026 21:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771880413;
	bh=aKIOPBEcPL7Dk1h/PGRlgq8uxS4h2Q3OebmeEXbtGrU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=dW+gRcDpc+IaPOOMnWSjYgfsU46PqKyt4wynMqBWTXdnv5yCyb+/j6hzzlCPrjUxV
	 rM9EjbGfEYC7uf7xEJCg/JYNzOm2ot1zY4g7xUxTm83ID9AIDOLLaly7NE1pYmv7vn
	 uIeM93JmgIvnR8KLN4dNenr3xjLS+YzarY5qmf1P1o3jobWaapRom9Mm1AjVTlaf+I
	 mPf8gMKIQrdg4riXxWb+cstM4+khOcOONnbw9y47j0//dXTR2KSscjQ6KPFbRRh2wJ
	 l/EG7qnJA0816xvY3DcKtPQO2E80fMKw4pkS14owwztTwxPjRjtjOMmeiMsqTE0c61
	 Dgv2mg5EDAY4w==
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7d4c9537f90so3181917a34.0
        for <driver-core@lists.linux.dev>; Mon, 23 Feb 2026 13:00:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXftQg25chYY6fLJ+3hu6APWScPAQxB/fA8dFLgNThtoEEg02Imx7awgzUkaIwRf7rFMow06MMqY7lttQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwXZg6D5rLtB0xPZZZsAy1rI4x4sAKwPkDsFUfgb3OLVpG1roQM
	XptAt8relxe9kc4y6aKk0dXmdJBcqfkoP/nBrGWx7g1AK31mfAaNdixwI9/JkBNp84eW9rLW6Sy
	lLukcJZoY0EYsm7gr2k8hu8Bn7XfGuNY=
X-Received: by 2002:a05:6820:828:b0:676:e8d1:bb55 with SMTP id
 006d021491bc7-679c4633dbfmr5559963eaf.59.1771880412242; Mon, 23 Feb 2026
 13:00:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260223204412.3298508-1-andriy.shevchenko@linux.intel.com> <20260223204412.3298508-3-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20260223204412.3298508-3-andriy.shevchenko@linux.intel.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 23 Feb 2026 22:00:00 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0jntUyx4DJ07sLtoa4RnnRWQb2xgmdRSNLyj7sFOReOoA@mail.gmail.com>
X-Gm-Features: AaiRm50Rx8zTucSDLsNIxMbDIuTm93F09BFbzR-XqIfRD_hGjwt2--dK8TBuUjw
Message-ID: <CAJZ5v0jntUyx4DJ07sLtoa4RnnRWQb2xgmdRSNLyj7sFOReOoA@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] driver core: Split device link data types and API
 to device/devlink.h
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Zijun Hu <zijun.hu@oss.qualcomm.com>, linux-kernel@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-acpi@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Len Brown <lenb@kernel.org>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 23, 2026 at 9:44=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> device.h is a huge header which is hard to follow and easy to miss
> something. Improve that by splitting device link data types and API
> to device/devlink.h.
>
> In particular this helps to speedup the build of the code that includes
> device.h solely for a device link data types and/or API.
>
> Note, get_dev_from_fwnode() goes to include/linux/fwnode.h as it seems
> better to be there (it is on one hand related to device link, but it
> is a getter for struct fwnode_handle respective field).
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  include/linux/device.h         | 86 +-----------------------------
>  include/linux/device/devlink.h | 97 ++++++++++++++++++++++++++++++++++

The name "devlink" is somewhat ambiguous (see
Documentation/netlink/specs/devlink.yaml), so it would be better to
use a full device_link name here IMO.

The change itself looks reasonable to me though.
