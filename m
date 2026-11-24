Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795537035;
	b=BAiZBZSdO2bGnZ1MmBBvenFjQMEDBUCrIJP6kkw//wPgP2DU0fKCCd4lYOwD0BrpZ9On
	 o8xGRkpfs+M4e5hhHkDELWIbRL6kYeoYl6hBpEAH3DZ5zEerdniw2r3rxUDBH7EL0kPKD
	 dmwzI3qvRkEL88msaVXmLUxvpyzySKBBqwZ2H421xA2mX/eu0BP1jE6D/mdF3iV9jIS4i
	 WBJiKYU2wq5cbVzwKtGbwqfcXyfl5gU3glbOdKNXsgyTY5w8p4wyBRNAt2zN+bTfZad/m
	 JUdKsmKe/FHl3zTD+2DHBXvnGdepWRzR5H8/RNs2TyFLX58RvtjKu+fOF1KYRqjbXtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795537035;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=kxblDUMyGzlr1U89kDKvE9h06l9IfZFAg9l5rlO4ajU=;
	b=gINsLSL4fd+XKv4OL5QxLfInFjqAcqrC4U2ZNOhqJrUQT1BFfmMWqfihJPdpmBYH+Fvi
	 oHvEqYt3Iw12y79Cch2s+Wt7BAI811YLth5UUGAXkx4ei1v5ZNeJVuj+joZ33l6RojJbW
	 Mjaym9gfVkVRR9uJlpGomQH5Ei+8WoxAECHeBo1MLhx8LCvRUA9M7GVpsYmiw4yduf4Ge
	 XIX4afYCHPvUtCml8UVfdCbA2sZjLtxlBvryK68h1otl5WQx8X+LfSZiWii9SVtUPMsHM
	 0x1gpPcS1hCEhbbH+lrSx5XCsDOYM9nbryq8hVW0kSmd+G1zN9YKtPrYl1ujV2i1QwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--zhichuang.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=HrJINuN6;
	arc=none smtp.remote-ip=74.125.82.69
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B33C606A684
	for <driver-core@lists.linux.dev>; Tue, 24 Nov 2026 16:17:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B33C606A684
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--zhichuang.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=HrJINuN6
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-16bc6f3fdb1so3006595c88.0
        for <driver-core@lists.linux.dev>; Tue, 24 Nov 2026 08:17:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795537034; x=1796141834; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kxblDUMyGzlr1U89kDKvE9h06l9IfZFAg9l5rlO4ajU=;
        b=HrJINuN6C99Qqxt0/ssnmgPaHvJg09ewToe/JeAYuFiYXMUUFMiM0iNboeRMdnPEP9
         wIObUGULOSzHO4bX0Bx1j9FOdUJcYdtyjgmZTHDa9tiCESdT8ysQmJ9mqvuuyHUNPJ/X
         vz/EnHoDBCY+Kkf0omguU94qP9wMHMvsVFXeAmypQ64L7ciYXp9rzi85vY6NBqx5no53
         X5e2wW8elc2v44rsFMriI3C9hA6DQcJzh1mU7z305ocSdRYW/H7QEUl+zvE/HeJrIhU9
         hudu2Z1zc3G3xS1Demb6EL3Sf16qooYTsk3+uJUvK8RxpymaLS2TZVcGEWxqJ50o5tfd
         PtPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795537034; x=1796141834;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kxblDUMyGzlr1U89kDKvE9h06l9IfZFAg9l5rlO4ajU=;
        b=c1m20WGg2Y1bzFcllyOYE4d1C5c/aOd7Faxdkb0AY8obfkiCWtPPtmqEAg01uk4V2W
         nOBji/umAQdcXNCt1/MxgBgu0QcrqqfWG510Epthx9tupvUyL2XFrfuX1RW9gCdXczU9
         VKm+qwLMd/O6Dw2ylZoDQNiOzCplu5tFCloYeWI3GsiKZxvy1cJa03ML/uDIypv/1d3h
         Reitb06knEEbAeGztKzuQEzrXgEfl64o2oAgGhoGWlmqTPsDjnNWkdCfaDMct1fG58Q+
         aHhY278kNmXksVz2Cl1e96SsFQ4aZJZjOZ1ssVD0SV2UUjKb4MUorDcmEvqSYaD8HGrd
         Ghyw==
X-Forwarded-Encrypted: i=1; AL+hErEcwXJr2fmWf8402Z4h5/4KHPXv0lbx9MllBRWsM37xACQX8YBmSD6StHb2xzFUcUoTZuU8Xy74ianGFA==@lists.linux.dev
X-Gm-Message-State: APuU4Z+8AKh+gPcFIRHlwRwO7nblJkYkQQtQk/50MS9k33YucVG2cM5Z
	I4B9vIxjRfZMWXbEs1RjpzDBvMdT6QeT05Ynp06mYhAcYzqoqiW63j1sbalrIsCsfk4SBVaIOHE
	sFxVwX2+1HlYCPkCctg==
X-Received: from dldyr25-n2.prod.google.com ([2002:a05:701b:4519:20b0:163:a42e:b837])
 (user=zhichuang job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:701b:2089:10b0:151:2e62:fe8a with SMTP id a92af1059eb24-1b5568feb61mr15349607c88.40.1795537033939;
 Tue, 24 Nov 2026 08:17:13 -0800 (PST)
Date: Tue, 24 Nov 2026 16:17:13 +0000
In-Reply-To: <20261123083337.2731019-11-aneesh.kumar@kernel.org>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261123083337.2731019-1-aneesh.kumar@kernel.org> <20261123083337.2731019-11-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261124161713.263759-1-zhichuang@google.com>
Subject: Re: [PATCH v1 10/10] PCI/TSM: Configure accepted device DMA during
 driver attachment
From: Zhichuang Sun <zhichuang@google.com>
To: aneesh.kumar@kernel.org
Cc: linux-coco@lists.linux.dev, linux-pci@vger.kernel.org, kvm@vger.kernel.org, 
	driver-core@lists.linux.dev, djbw@kernel.org, jgg@ziepe.ca, leon@kernel.org, 
	yilun.xu@linux.intel.com, aik@amd.com, thomas.lendacky@amd.com, 
	ashish.kalra@amd.com, suzuki.poulose@arm.com, steven.price@arm.com, 
	bhelgaas@google.com, jonathan.cameron@huawei.com, lukas@wunner.de
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 23, 2026 at 02:03:37PM +0530, Aneesh Kumar K.V (Arm) wrote:
> +	/* driver_managed_dma is unsupported. */
> +	if (to_pci_driver(pdev->dev.driver)->driver_managed_dma) {
> +		ret = -EOPNOTSUPP;

Hi Aneesh,

A short clarification question on this check. Because it runs before
the accept check, vfio-pci fails probe on any locked TDI once the
platform TSM implements dma_enable.

Is rejecting driver_managed_dma a scope limit for this series, or the
intended long-term policy? If it's a scope limit, is the expected path
for in-guest vfio to enable private DMA when iommufd attaches the
device to a trusted (TSM-owned) vIOMMU domain, rather than at
pci_dma_configure() time?

We have a user-space accelerator driver that uses vfio-pci on an
accepted TDI, so knowing the direction would help us plan.

Thanks,
Zhichuang
