Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795107610;
	b=NsLi3XzREsWOvP/IA0OCApU0X0Z4S48orF0bvmwNn3hewwvw7oIjpsrJrKxJYuEAqoBp
	 jjpErT9jy4Fw2xmy+VOCcF1Q0+eASSb2JapzopnebBxXFwFlCVaaOZ1Lbo9OF980RA386
	 Lsq7CoWB7U0TGFxJ9kZK+7tQsZmZDhJLaqazhgLUqAKS3S/PILI9RhlYmKIW8/THqZX5M
	 VdTaufx392n6dPFfEa3xtZXievJCnmDsmhnqq9lbOzfYWeGWKX2PGx/jAyi3GsDjB9YQq
	 cYnPXpY0MyjVsnytjZe9if0aGPFUSWLJ4xvvoGXNTMIluu5IyhU9lCUxHQEaSxyVDZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795107610;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=CiTqCpQJdYGGJFNtxrXNvASMfUkzg0hHA2VN36wBsjs=;
	b=ko9nKfv19feNDTnLZZVb5nxHfvoXoH7ZhO/pjHJP7xYl2tW8xbcV9MhSmn9OD0+a0wz9
	 G3fP9AR9PyYT7OVdalhJKyp+NR1CryIU/fd6Qw+VVqnEN/K3xXmuHyur+eUUOtnuWyzcp
	 R8JObKFNWy7552dqw/LZowAIBqFc2NrtyatJBtNeWXonln6S9EA2qshdd2w0jZpzYVDnT
	 HiKP//jF7HsYpcw++9GC3D/HySeTLPH9trrNyu7W9kRgaJBqoKRYrdNT3QIrhyNFnv7Rm
	 ///5ZTIfCafJJV+XIxW9xx1GMRN2pEbUh4aYkS7sbGrPTgRh5NASntAulkR7TdU5VIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Ac46iD/s";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1922F606A32C;
	Thu, 19 Nov 2026 17:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ac46iD/s
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCE0C1F000C6;
	Thu, 19 Nov 2026 17:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795107609;
	bh=CiTqCpQJdYGGJFNtxrXNvASMfUkzg0hHA2VN36wBsjs=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=Ac46iD/sEroCxh4O9K9a8mXPK2ul0fq8Bs2U64bozwRvnjNvpwINRTeoHwps8Q3Cn
	 lhryHYsJFS2YQ2Rv4pREzYNzAEPdxTEM9PODh4EpeGk12UWRejt9SX9pPnnxDPxHEA
	 xNgy2o16dJZBG3Ye1R1gZiCerRNZ7AtUOKTugoLzBs/DUzCtS0+kt3vjRTbrtpUDRi
	 vCAlYSs/P6NbVgRX+4J5tR4Wht4Wy9s+0J97YsPVtyAWzU48nEx+x6iBc4g9YEj3Qe
	 R2t7iQjzjqyqHMd8QRlSn2OyUgfwWmDQ8yFa2u3yLGGAaF7ARk6+2dp+e/Ev91W2Gw
	 yI+DnCNE8dudQ==
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 08/10] regmap: drop regmap_bus::free_on_exit
From: Mark Brown <broonie@kernel.org>
To: Peng Fan <peng.fan@linux.dev>
Cc: Mark Brown <broonie@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Johan Hovold <johan@kernel.org>, 
 Lucas Tanure <tanureal@opensource.cirrus.com>, linux-kernel@vger.kernel.org, 
 driver-core@lists.linux.dev, Peng Fan <peng.fan@nxp.com>
In-Reply-To: <20261113-regmap-improve-v2-8-5dfd6a89078f@nxp.com>
References: <20261113-regmap-improve-v2-0-5dfd6a89078f@nxp.com>
 <20261113-regmap-improve-v2-8-5dfd6a89078f@nxp.com>
Date: Thu, 19 Nov 2026 16:59:58 +0000
Message-Id: <179510759875.116416.1025341724543668395.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=640; i=broonie@kernel.org;
 h=from:subject:message-id; bh=mKDlpOonvf017bM+Q5kBo4V+A43WAzKL1hQR+RVXhE0=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLL+a4umKyatfTFtdd3+9csrY+V8DWa7CirvWFtz7vyFy
 bn/Ayb87ChlYRDjYpAVU2SJy+J+WV/yeg3fwYVtMHNYmUCGMHBxCsBENp5gZDhw/d+NowGSbx9w
 Hb4kodoXfSrVRlZjbuSp676LTu2YYZjFyHDF+qXa0jXpCy987Jjb84DLLU//j4o817L/Oq5Pt5T
 +1uMEAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

> The SPI and I2C bus helpers kmemdup the static regmap_bus to override
> max_raw_read and max_raw_write per device and mark the copy with
> free_on_exit so that the regmap core frees it. This is the only user of
> free_on_exit, and the per-device limits can instead be applied to the
> map while it is being initialized.

> +	void (*init_limits)(struct regmap *map,
> +			    const struct regmap_config *config);

struct regmap is only available in drivers/base/regmap so this won't be
usable for anything outside there.  Taking the maxima as numbers and
passing pointers in might work?

-- 
Mark Brown <broonie@kernel.org>
