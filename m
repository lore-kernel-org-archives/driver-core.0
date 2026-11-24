Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795485888;
	b=doUJSLDlUYrVieWTSVXc5IvCDP7JFOwa/MYwDS5+nBlHgMYZyTggTIMD0wA6k6JcZxrL
	 89GANuJ2xj8hKyHhA/1Kr8GWJ1iGXviRYtdACUsBXHFUa2NlERjkGMgOX8rdqh2f/VQsg
	 e4pFvNL3N13z6tmKGLv4WiFM6cPLAu7Y+cGIXgWaXndLqMqz39BbgRWeJJ+T11okZgCy9
	 QWAo6GJJ9jIqrWVMR0XLnPPSl1hVyT3SW5BKU06YCDZprE4zjMrnO7Y7k7ZYyDPJzfEfj
	 UYA8ZOf74/HIMEQJJ0Zl4awRoXdmFxftYYKankLep1icj4E+YdjNM8MSgUJpGLMv8iQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795485888;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=QZ8jeJhff8TwVzDr8mq7hnVn9Uwjnn1WsiAHJK7NNrs=;
	b=bdFm1eSLsKQWsozfpHhH3JiB6EJ4q9yVLxzivecA9iWSIR7jECS/oXzkQ6wEM6snfByR
	 vU48oiBmwUSPF/97SsNlmkrqJC70NGu5jb37eFoGr/6gao7fpHRMnvZRSJfdDb+yikkER
	 DAXx+u8aW9tqpo726PlN/gUbxQ9wiADpzQqtoGGwDcfmsplOSfh0c0OKmscKvCn1N0iY4
	 jc8hZmWTvRpOKb11A0rlbhX8Yvapxq9pvXXCa4FjVNBTvl71ui2a8/QaNw3UyDnrrjC+D
	 9vAcRTBe50pY7nMvl/IVEtjuT24QKDzIhPtAIYIlgDRsBippj+8V5l0dsPthSX9ZXFA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Au1HBdhe;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.45
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10AA8606A322
	for <driver-core@lists.linux.dev>; Tue, 24 Nov 2026 02:04:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10AA8606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Au1HBdhe
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5be58ad9600so19741e87.0
        for <driver-core@lists.linux.dev>; Mon, 23 Nov 2026 18:04:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795485886; cv=none;
        d=google.com; s=arc-20260327;
        b=X2E5cIbMEIJ0VNLCYMUTwIms/TuyJ8p/FLY4zG7LIGBen/cJtwvAZVedo6V844u6sh
         UEyXMRgUn3L9+48f/27zK16YH+ZtwvHnA8EGXTfQj2JK6NnqmOYioBsGwy0f3/hZsVl9
         a7xnGAKuL2vrxings2pkvlFJEmgTQ2VPlx8EM3dexEhh1VAySLZqk6Op0h+XsAc/IbTz
         boyrPrazLWzTV4/FLdgL7fvtIfzNpJKmNISp2v5zl5w3FeSi7dxAHrcp2EmutxQI7fNg
         O+qm8kGhC/4qx84OlX4SWuHkbfK12BKEMHj/bUtpvJr06nuYkHTjJkyAto0QG5CeCeNV
         uvpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QZ8jeJhff8TwVzDr8mq7hnVn9Uwjnn1WsiAHJK7NNrs=;
        fh=AV9PKQiDhtRyY99FMrQ7MV7TgGeMR4f+fV9moq3/ndQ=;
        b=G3hK9bFxSRErUFA2FU49xIZHMgoZIaE10OM/eLzzqaAc8HH6cd9krNRPz+gCdxpJp8
         SlvKvb6R/AIR09Uq07Z+2U9cZ+4vdtTXkdhYKE6YCk7ZKQ/f4Ws9ypEK9MKtz5CML4Ov
         +Sa3meZvWdsZQeHY4FZ9U9Tnncfo1Pb2kSbgtpakSYiQDDifAy2rJePJxme055KuFzvk
         V01ZBUNcU7Y5irQ5sZoiMhkcfuvuGlpugnP9WzuGuK1wlb5Glqfr8zN9+rJrgzAP8jUN
         UlI0xebzHrhNj1lPrEBEj2O/L5stimh5cDDBsdttIr8OPFjB+8Mu2Qhgb1P5RIDDyxrY
         Of2g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795485886; x=1796090686; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QZ8jeJhff8TwVzDr8mq7hnVn9Uwjnn1WsiAHJK7NNrs=;
        b=Au1HBdheIzpAbd2JoZkJkQuYbnbYLjNGax+9Hgqt/+wgW+dQkphN03XyI7+UWrLxw5
         izZydNoKXNvErjrsKMm2ue+FEhfe50HtcfX6uJGyctgWhIG8mZ11UuqS7K54uMoj7+9M
         eKapPGz7xh/ofqlTmLTn5qyO7ylq6eZ+jI+9AeTed6iskeCWbWx8tRDs8GpOv3/i0LMy
         xJoVMQfgJIDlbfl9cynDPzxBpDF+theiAdtA8DmYSpNLp19XPjBmDBrqkieFxaKbgGIy
         X0JzD9V+vycsTLSKbic559tNb6t/Ay0vyk0+UhUiw/xYLbSDQ+oX7+6ICznujlH2Y44D
         dUKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795485886; x=1796090686;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QZ8jeJhff8TwVzDr8mq7hnVn9Uwjnn1WsiAHJK7NNrs=;
        b=V1JZPPrbNw600xQAXd7gRWm29KUao9+SAGfFDPaedSh2yjiNltzI8tOyihChg6ObYP
         SPhJ1wHQ4TscMDyRW4mX3w3/OHwBzOy6BuBN7T0kZkfEangj8XT44DKyu+Ss3mrOIDI3
         zHLgfEOMcEY6blSVyAipVEkQMA7HeJKjON9sxDTEdtGM+XfmFAaoeHHHH2uw0GyvnrM6
         awSrBzP/lw+AcsGQspvMUsXnH7XOZDPBjUDEqw5nTR9rXA81iQKcOnBkJjTFdaMVGSau
         24CCkTauvPX0bFYHC7+vIpkZSFuP1Nq6LRLuDjtAfUKV2jSH2qPECe17685iYtl1lGYl
         3P9A==
X-Forwarded-Encrypted: i=1; AL+hErEf1BgKm+XyPUyncvx1f4Z4vVla0xj/jO6GKcyjodoHvZUpqVKQ2YfQCQ1l/3xBTriRCoq4G52bHa888g==@lists.linux.dev
X-Gm-Message-State: APuU4Z+po4tlfy9XXhR+vkesoHMDa9lg7hPbgKw8gxP7j3DFUQ+94axb
	tlhclIdQn2YkH8mmWf2NOYy8si93NWw86v4zXYaBfjhctfPBfA3PxyU8Hay1LUzG3dAVya73snc
	oRc9lII9Aqyb7KrsmZ+Rlfbjbj7NRmNqRMdXOcyAt
X-Gm-Gg: AZFdTZf2teP5d4VWROHJXyG4DQLmN76DXKVMbvNcSza6/jqPRZGwuwHu2yD8jw9YyKw
	L2TDCcVnMCGvWetGKobJfjXTDzfJxc180FD+CaMyUjxzyggzn1J7W7GZ/FEeRzXWeTPpZAq8+uS
	avrJim79GZ8JxU1y7Fv38swiXKFzqdwZPZY1EJQp1ZeUAnD2QMfN34n6gmZE4/UNw26GMB03ci5
	hHC1hiASdJ5UPMTfhWbRhc4JKfvoKdT7xEG2GdZFJdhqLq/vKu34soE2GByxkB3KUz1CJqrvnMj
	Xa+DosjhW9hjVrWn7QjWrpH++lidSx48MklP4LdGqGxJAJK/R1CoLcegMvAFdb3i8AeTOjs2PSQ
	rTZLXi0RIMZfBfLQmOlP9edxBbFB5pZF6X6mG8LRbBm2uTx/258S2jiqYAOZsA1hVnGK6QplAo8
	RGZb+2re66Dal75slh41sXGdKn1ICEHRsWlqc35Sao+o75OXjSxkU=
X-Received: by 2002:a05:6512:b9e:b0:5c1:5209:5a44 with SMTP id
 2adb3069b0e04-5c1c8239441mr351300e87.4.1795485885773; Mon, 23 Nov 2026
 18:04:45 -0800 (PST)
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261123083337.2731019-1-aneesh.kumar@kernel.org> <20261123083337.2731019-11-aneesh.kumar@kernel.org>
In-Reply-To: <20261123083337.2731019-11-aneesh.kumar@kernel.org>
From: Jianxiong Gao <jxgao@google.com>
Date: Mon, 23 Nov 2026 18:04:19 -0800
X-Gm-Features: Aa3M54qI-S6sAhD3oo3lD3dF7U9WjxfGl_G2FEa2MNAlB4C8vKhlPO9m5SK63WY
Message-ID: <CAMGD6P0pNAnq9U80dnpgbz+hHbX1yH1bdmXjcie4oiq7KizU=A@mail.gmail.com>
Subject: Re: [PATCH v1 10/10] PCI/TSM: Configure accepted device DMA during
 driver attachment
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: linux-coco@lists.linux.dev, Dan Williams <djbw@kernel.org>, 
	Leon Romanovsky <leon@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Jonathan Cameron <jonathan.cameron@huawei.com>, Xu Yilun <yilun.xu@linux.intel.com>, 
	Alexey Kardashevskiy <aik@amd.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Steven Price <steven.price@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Lukas Wunner <lukas@wunner.de>, 
	Ashish Kalra <ashish.kalra@amd.com>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, driver-core@lists.linux.dev, 
	linux-pci@vger.kernel.org, kvm@vger.kernel.org, patches@lists.linux.dev, 
	Zhichuang Sun <zhichuang@google.com>, Piranava Tamilselvan <piranavat@google.com>, 
	Erdem Aktas <erdemaktas@google.com>, Ackerley Tng <ackerleytng@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 02:03:37PM +0530, Aneesh Kumar K.V (Arm) wrote:
> + /* driver_managed_dma is unsupported. */
> + if (to_pci_driver(pdev->dev.driver)->driver_managed_dma) {
> + ret =3D -EOPNOTSUPP;
> + goto out;
> + }

Hi Aneesh,
A short clarification question on this check: once a guest TSM driver
implements dma_enable, pci_tsm_dma_prepare() will reject binding
vfio-pci (and other driver_managed_dma drivers like pci-stub) with
-EOPNOTSUPP on both locked and accepted TDIs.
Is rejecting driver_managed_dma just a scope limit for this series, or
the intended long-term policy? If it's a scope limit, is the expected
direction for in-guest vfio-pci to enable private DMA when it claims DMA
ownership / attaches an IOMMU domain (via iommufd or vfio_iommu_type1),
rather than during pci_dma_configure()?
We run a userspace accelerator driver over vfio-pci inside a confidential
guest on an accepted TDI (similar in model to DPDK/SPDK), so knowing the
planned direction for driver_managed_dma =E2=80=94 and whether any upstream=
 work
is planned for in-guest vfio-pci support on TDIs =E2=80=94 would really hel=
p us
plan.

Thanks,
Jianxiong Gao and Zhichuang Sun
