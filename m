Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792768361;
	b=a459uZa37o9f362DNGr6wRVrkCzzhOFhFw+FWtLedbjc0XtaxNDDyNK9On7ECaLYSjI2
	 NRYxlIL3XO5M+vYrYtpvFAjMRUqFmzAySHxGupNOvuF29gRni8V8+Mw6Kgafc8hMz21Rn
	 WMwvqZVTLm2E+jAGqTeIP+ST10cmknS6RhXy2vJAxmR6hcPgDOqTpQMdRth0hr+4eUsuz
	 okjO2+T87gsLOteBNbE67ZvrwCzzrgJ/8bPAWPulz4U4mBjXm38KNwIFkx0BOoH9tJXtJ
	 GaraVV6ZRdgUQT0Md4UKZ2HCdLwJA9aTL+MjIw5sbyZCeldyG6n2nOzufV4J3FQxtWA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792768361;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=GTBZU2NYoxY52zS87kN5cvRsx8+DZYRk/wDlQGdD9fA=;
	b=RxtAKAUaOu7mf2wgd89I5EO0To7P7xJHpCClcLZg6T2F+tdhoQHof4VxCtR0HVTlFE9+
	 JFx55B+pY4CgpIdrWk2eBukHRTcqPkRonZ5gVWa8Z/sY/s/3A11nVzZmZtizNM/huBJTk
	 7nmDBORYgUbCXcgybIG2+H450+E9XazdmBb47cs6T5QyfaWdrBP/r1DEFHBBhjDvQFwF6
	 ZkVES57whgfTHBr2mseC8fy6KXxVYpWeWq2ZxGTaZPjtuMtLj/JocYWF/h+jyZG6xEobl
	 5+xU9szMgd562j3itHVCBvEr2b0wN26oe3jZZ6mLPYpjWnlEyBq2DvGCXmQpPlfauQw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=wPcARuvX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D382A606A328
	for <driver-core@lists.linux.dev>; Fri, 23 Oct 2026 15:12:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D382A606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=wPcARuvX
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e8d6fcbba0so60955ad.1
        for <driver-core@lists.linux.dev>; Fri, 23 Oct 2026 08:12:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792768360; cv=none;
        d=google.com; s=arc-20260327;
        b=ogm8uv2s/QtvIurQMTN04R1C4mly0ORfjCIaCUfHzrzRQBSWQWiwlvkTcBMOICWhH+
         pXKfyAPoBc11jxwP1V9EpXEFVR7ij45h6srfHSXQTL0v73CqF12h0rIlmZ/M32d6qNmY
         Rf0pWJOwA13OzfA7EUESgwx7m7saNUldHksDw590y/NNo0gEw90EBRq6YvCPHEOGXPfp
         Tic8sHMQW+IKArU08DGrpj5j503AgmGMfMEQfjecfg2fjOVmyAWQqEkYaYuDgf9EQacT
         wKgThTBXo7PpSckuuCqmLvXP5UXXc9WemyK/l1K6MODNrR6XN6qvOpFYfHdHJUMNcXu4
         Mg2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GTBZU2NYoxY52zS87kN5cvRsx8+DZYRk/wDlQGdD9fA=;
        fh=ygFmlYAsmp6uFS8rVcZwFR5Im5xrbiRXCU/ugaZIjV0=;
        b=YuUmmEAZVxfIPtGupyzUgPeLpOSOJdMQ7AOSXzN4U+cZKfcmpm6j/RCq9Hw0IKQHFv
         q2iNJM4EkWpr8m0goliWkLYvL7p1VtmzxcVx9yaLaxLY/jDxOX/3ar9D4o5UCQu+HoRa
         Zh9/Ka+V8oizszA0qubEjChbKpFqmUdqlqWfmlR4FxJTF9wYxmAv51wVNoTN/Kmf1HjS
         jg0oVbPnmwaBBrsvQXSde0hGHVB9nTroWv+d2mkCfeWzZYFFz7smUrjkWMMJIAd6rkQF
         gc9YLgaG4DxmNE7IF1lJ0t0lTVw72ojyziBJZl4vJN7tSZSYrBzCOTd/9iioz5t+Ch1O
         2ioQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792768360; x=1793373160; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GTBZU2NYoxY52zS87kN5cvRsx8+DZYRk/wDlQGdD9fA=;
        b=wPcARuvXJMuTkGBQkbGyDXRpdJsWIWehT3z9y+lhYS+duvNjrGA4TZbeuLH4aN+Eqv
         PZ5JwDHBRhs0Q37YBwO/2jkik7Clf70lwOnp/ZSvphUKObQwanMYpf9guIgk7NeBSALg
         0qMqWe8+jTQylIwPwXDW17+g7Fup2qWuZRpGawyrgR1spZ18TsfaLAx6xtuhH+v9w77l
         ucv2ysNl7Jfzs9uN0n8akkcRfKdRH0Vw/sDgO9S5L9yqi3NjsLc0cd10l8jxCv8IfYNV
         wSxor2JMR7Nk1Xe6CUFT7OmiSC3FwtVgLcMWDKoOueAkQcG2j3rZswLFBE/P8gRQ8YKx
         LiFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792768360; x=1793373160;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GTBZU2NYoxY52zS87kN5cvRsx8+DZYRk/wDlQGdD9fA=;
        b=EIVtxqkV+Q+eqauJlWsdwPCI4rIMa1MLiAzKDWPODDpz5l4d4OxbUEEYm77QBWadql
         qDCRY9E0zf1pjcMHddtOUmBlOAc0pCrX2tXIdFDYrY1MtaPynBYCLX53hYVL1/tBAnwQ
         /nzOnK0DA4UuOv01SL0WfZ5zstPHCukGbe407Lk8ZNJg17uU/HOS0h4Mn3uVy9zNwwat
         iCWZSucGMUe+Bd1kZW7AocPmLHOMgYT7Poi+XI13bZb8aQToVsou9eUFkgC66I6bQbQV
         S7uYwkPSNAQ/aNNzahyNsrs791RbrsyxpDT6nNUWGDWhmpPjqITwJ1uaYiAppVGxn/Ay
         3lFw==
X-Forwarded-Encrypted: i=1; AKwUvBz9gvUgSpr4Gcf0drXwoGen2JSt/caWX6s7bGcstff2oXDIz5CDBGYiZLJJbR/cjrW08ufywwfHxDaKKg==@lists.linux.dev
X-Gm-Message-State: AFq9FYJd5Y7tQm6yURwrOY/JhM8OH++XsrJBS4l1oxc9PKqPDKOA/pVc
	jpBKijl/Eq7j0pbooh8eITa67mE/DF7RcYiqa4GvScXif09Pv7o1nNzCLOYPCmQe6JqMIbAb/ic
	OylkfmzqVMai0Eo4Hr7ouqfRxBBZU7ryFfCeBt8hK
X-Gm-Gg: AYBFou2Vl9EU7a2UDixEC222Ms1mhkB+bFEPBt/h2d84DIvGDkajdvfVLBnZXRcYNJB
	eZ7gIgNs4cSQ7hvLlZhYAdcnHWSpg4gPNKajrZ4vUDC/QnLUQTLXhBOukWisZqoitubws/F9j+k
	rI1OI9ICg+ZQUq8nY/3OaeuawgHwI+vHQGhTc0irSamJtbK4kDN07aDHe4zgKU5REAuXmr5N6e2
	ZAXq4/tFgd7PWB+c39CfCFpgwHpcfbBrpPBA7d93Baq7GMk+vh3RfUDkfxY05jnlYq2sijbJJV0
	eWmtpjOz71TemqpuLTwl/BgumdfqElzaKIK8XrGpzqLbx4wg8rrswN7ZXezvD3ClT6VyRLeERH8
	s3Sh9tHnShalUauenj7FSHHULwC5VS3IwYjJeyw==
X-Received: by 2002:a17:902:e84f:b0:2d0:1aaf:daec with SMTP id
 d9443c01a7336-2ea7f4e1cbemr4092325ad.9.1792768358959; Fri, 23 Oct 2026
 08:12:38 -0700 (PDT)
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261003212241.3432303-1-lrizzo@google.com> <0cc1cac1-a500-489b-9c1b-b49598b5550b@kernel.org>
 <CAMOZA0JaiKsRgDdjHkL_N+MshhcyLSv+cT9SzEbNsC_sumHvOw@mail.gmail.com>
 <b31efcd5-149c-4edf-81a2-1744d363c390@kernel.org> <CAMOZA0+6kAbwgNwGTsCT5AqpwcZKz4pziEGC9UpHkNCVoqrF-Q@mail.gmail.com>
 <20261022201229.GH3381610@ziepe.ca> <CAMOZA0KaanmevmvWS=M3gKfBeborzfCQTiF_xbSeYMWbozG7Mg@mail.gmail.com>
 <20261023140107.GC3977851@ziepe.ca> <CAMOZA0J+MOLv+s4PAvsAK1jbasnbQRyHffZw1VEKutH9Vr6ODw@mail.gmail.com>
 <20261023145023.GH3977851@ziepe.ca>
In-Reply-To: <20261023145023.GH3977851@ziepe.ca>
From: Luigi Rizzo <lrizzo@google.com>
Date: Fri, 23 Oct 2026 17:12:02 +0200
X-Gm-Features: AclHuK9W5A7aXTPFZUdD2jRhpUmEtp7k-vVQ254ZWcJE4ItfG1TCZYdvtBT8nSc
Message-ID: <CAMOZA0JfsviAkojjEewehxMq0r0AboS=L6AWafMj4_Azaeg-ww@mail.gmail.com>
Subject: Re: [RFC: DMA_PMD 00/22] DMA_PMD: PMD_SIZE-backed IO buffer pools
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, Luigi Rizzo <rizzo.unipi@gmail.com>, 
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@kernel.org>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
	Willem de Bruijn <willemb@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	Joshua Washington <joshwash@google.com>, Harshitha Ramamurthy <hramamurthy@google.com>, 
	Saeed Mahameed <saeedm@nvidia.com>, Tariq Toukan <tariqt@nvidia.com>, 
	Tony Nguyen <anthony.l.nguyen@intel.com>, Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, Michael Chan <michael.chan@broadcom.com>, 
	Pavan Chebbi <pavan.chebbi@broadcom.com>, iommu@lists.linux.dev, netdev@vger.kernel.org, 
	linux-mm@kvack.org, driver-core@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2026 at 4:50=E2=80=AFPM Jason Gunthorpe <jgg@ziepe.ca> wrot=
e:
>
> On Fri, Oct 23, 2026 at 04:30:25PM +0200, Luigi Rizzo wrote:

Just addressing the last part:

> ...The CC stuff seems
> actively dangerous. Unconditionally always using CC shared memory for
> skbs is completely security wrong. What I have traffic flowing inside
> my VM between containers or something? Does this end up putting those
> skbs in shared memory even if they never hit a physical NIC?  Same
> with a TDISP capable NIC, does this unconditionally degrade its
> security?

the current series was RFC and "unconditional"  just to show the concept.

My next version (a trivial change, really) is fully opt-in on a
per-device and per direction basis.

The unencrypted (or pre-mapped) buffers will only be used for traffic
that hits a device that opted in, and only for the directions that were
opted in. So we can finely tune the configuration based on hw capabilities,
threat model and performance requirements.

cheers
luigi
