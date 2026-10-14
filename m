Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78754FDE7B
	for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 11:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791975961; cv=pass; b=nKgqxmIFHVpJOM9LglpDFV7SphDQxz0pm2e0qVce9hwR2Sz3tlajvsRVo+WPkWstVAOjFRFxV+UQJT/gY1R3AJ88Gh4wae3WPmQwTF5LBlElXj4hMWHjv/kWhDOaHNM8PI6L+UXaRYRYvV4GuTS2PsM+fjkrBeYAJ6OLSF4WktE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791975961; c=relaxed/simple;
	bh=oKg3O/9qWwL0S/n8isR5H6f1yss4N5Cz6zPMHFWqGP4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CKWMzCEDlfyBo7Mmg97c52RJjmUPPEQL/lW6CIw8ZHWQaIMBjLedc4iP544yM9NjlorRo/8uDIsKgeJ4dQLQl2+MWS3XWasRn5bffviGUoiNndecFxvig+SSbsmvh5+9lpAozYzEiv3S8mHM1UP37r1Uiaw+RV60UkViC4pkpDo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lE+2sV2I; arc=pass smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lE+2sV2I"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2db33db4de9so212765ad.0
        for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 04:05:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791975956; cv=none;
        d=google.com; s=arc-20260327;
        b=sFRCfaH0DoJ9qFo2tZtlHOIOGW2puSQv1roJIw9IumVCCa8HDVdyvfrpHSzlg3cDXW
         Wbh44FDjWaszTRCsWMumI7j9CZhO8OgCEIfpFwAKRE/VnGRe6+DDQgQTrMO7zGjnwo/s
         cT4dL+gbLN4lnw+zNkUs8UMk57dzpnLsVuYcI7pweGXAzIoVXin57WEWxYO7xgzmzGzP
         jN2uCSfn6euyBtfluIh2apjklBA7VTQVFQ/EcyfjMoHpPVKoDBlxO8/Pc7o8QqenYBb6
         GWE0ZwU5NDy7JNqWVG7y5v+J0ME+Ld/14uT/gNiYHHMwxZ52csqEaIuS+pZKZ+mFitxo
         7LAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oKg3O/9qWwL0S/n8isR5H6f1yss4N5Cz6zPMHFWqGP4=;
        fh=uP9zALaQWeK/ynd4Io+NjWG+9q+UgV0QVaBFE/PGTXg=;
        b=lM+hjcxAi3t768z810tMvMFOGGl/Zg0uW3jDHltVI2yYOdUK1hB5DUNn2hAnpokdBm
         U1MpGHyUJrH4a0GK/jGwKa86eCJ8Fzh1Gzw68UAHENbsvfAt5dX5eNeEmzuV26YdgnM7
         VfBhDoL1xzhNd79sTYx00S7kcqT/2EpLt8pO92GfbZHcfzE64DsdjmhTjzHif51gOK9D
         aBHeR2tF/BLFDVochBJQ7QicqrGDq93y/LHYuZ2xbEtubiTyv1Tf27OQ1w03ao2Cimro
         fw0pHR22kJY4cIxgaWDNtknIiph/HgimVklfrQNor8Rv+LQ4C3NqZizXy65ukQ+qlQ50
         KMkg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791975956; x=1792580756; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oKg3O/9qWwL0S/n8isR5H6f1yss4N5Cz6zPMHFWqGP4=;
        b=lE+2sV2IcDUF/1ItcgOlzyshC3fHQGQesA5RiSBSp9/x6A/PWi64CVkfKlA7KdUqMf
         aIlpy2Gp0k/+mwnshvZjps9B9QMcFeBaVavDCNYinvaR3yk75SJXob4YDK1b6xMUxAxc
         pp7nCMCbeB/x62c5p3UtwZbWYCc1r/OEj6BZcYmGPd3s++sR55giFtU4r9P8cq0oWeHT
         6MbrXpjitNQ1svmtUPLYvz8A1ZuUX0M0AisAdhziNgogotTyl9rJ5BRL8tuMRQGnpEmm
         eW0HzX+cj16n2mKrt/IKFKylYtzIT7AIFNxW3pM/UFhT56fSW5nBcLjPTMBVwTb4BY2e
         wKyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791975956; x=1792580756;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oKg3O/9qWwL0S/n8isR5H6f1yss4N5Cz6zPMHFWqGP4=;
        b=fT6VJkaz3683F1bKUzSZYM17nC2IfWaW+3CaxLEiGrefuOp4ebaY06us4UeiFt1DvY
         hvUOcWHcW7uXufH9U9gpjR4loJZlWnIpSeJgy+Bvz9JRAygk0IUpW7Pxf9/LgXFJmizx
         v6kzDGT/qffTTYVEHh3j58Cl7m4G5A4oLS1SaHigNKeJ6NhwrT8DHO+jFn1+68Lh1Tl1
         co0Sx7jHnrfUmqRzDmJC1uozvwpdTqiN6sKR3Oq0FG3m+AcOtE9AOfZjOPR28JES1Ovz
         n//5+uRCsZLtvMROoMc+kRs2e5lYDze8oH2J5QBQJtCGGucsppRPKhIa/ZBDGibwNWz+
         VeCg==
X-Forwarded-Encrypted: i=1; AKwUvBxcACQ23dNHG53PSFXAvFPcyBCFmXxDkxKYFsLF95ZlsxspD1jlvyA1klGlvW5JRokjysc5jjS7Jeporw==@lists.linux.dev
X-Gm-Message-State: AFq9FYIKXlG7skT8M68Cpyxlo5xjmR8k/gtkRizFsv75k/l80mBfqV8J
	vB6wxnxtNhJAQOtg6Yma+NqLEl2555nW6q8nL3AoCV3c5W8Va7ZTnkEf+52GP6i6BpUVp7RPjJl
	OsP3TfDLwxQrPMZ0mAj26n4dyLNG3w3FWXM8++nuP
X-Gm-Gg: AYBFou3dwcZOZMybzrLmazU3YKe9MYZGFX0LB6+wq+raL8axwE9RZUjeMesDLOaD7pD
	/fy1K/s33EEbh3pRibYO2zoBi7rmrh2xTR72WDRkp/ZKyA95AQic8Frh4ZnDAh84pPmPdT1zZzE
	JawCHmR+dEuWUB9/G8qRBik0WZq5m/08d4AW92P4ii/cb3Umr8DyhXW/PsArFkBI+d0wP9bgBsU
	1d1puyGE9gVm6qcFaPZdsx8e9DnrkMK1WsaqHHB7IoZiGvgxbR5IHbnmlOLdVwva9/VkDJMza+8
	EuPDpsHLtknF2lcaHt9f3Lxp0MA8Cj/0uVfx8SnYBI4kpMw5qf8oVPDX
X-Received: by 2002:a17:903:1a2b:b0:2c6:99be:9dd with SMTP id
 d9443c01a7336-2e939d0f5c2mr3033515ad.12.1791975955291; Wed, 14 Oct 2026
 04:05:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261003212241.3432303-1-lrizzo@google.com> <0cc1cac1-a500-489b-9c1b-b49598b5550b@kernel.org>
 <CAMOZA0JaiKsRgDdjHkL_N+MshhcyLSv+cT9SzEbNsC_sumHvOw@mail.gmail.com>
 <b31efcd5-149c-4edf-81a2-1744d363c390@kernel.org> <4fda41ed-741b-4c5f-ae83-e3ea5a447441@arm.com>
 <75c229ef-ae41-4072-9c90-98d4779c52bf@kernel.org>
In-Reply-To: <75c229ef-ae41-4072-9c90-98d4779c52bf@kernel.org>
From: Luigi Rizzo <lrizzo@google.com>
Date: Wed, 14 Oct 2026 13:05:18 +0200
X-Gm-Features: AclHuK8XP34mfrE8lQUslMQMNc1nPr8ujKpQNMaoAI_u53qDQl4REr9J8L8QdAk
Message-ID: <CAMOZA0L6hWd=PYLF2PkYwMG11JCson6Wp4Fy9B3k3VC0Vt2R0w@mail.gmail.com>
Subject: Re: [RFC: DMA_PMD 00/22] DMA_PMD: PMD_SIZE-backed IO buffer pools
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>, Luigi Rizzo <rizzo.unipi@gmail.com>, 
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Vlastimil Babka <vbabka@kernel.org>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
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

On Wed, Oct 14, 2026 at 12:48=E2=80=AFPM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
> On 10/13/26 12:42, Robin Murphy wrote:
> > On 12/10/2026 8:43 pm, David Hildenbrand (Arm) wrote:
> >> On 10/12/26 16:45, Luigi Rizzo wrote:
> >>> On Mon, Oct 12, 2026 at 3:51=E2=80=AFPM David Hildenbrand (Arm)
> >>> <david@kernel.org> wrote:
> >>>
> >>> I had to call it something... an earlier prototype used the name IOMM=
U_2M,
> >>> but I didn't want to suggest that the design was limited to 2M (it is=
 not).
> >>>
> >>> Aside from the name, the _current_ prototype restricts to 2M allocati=
ons,
> >>> exactly because too large units are expensive and wasteful.
> >>>
> >>> In the code, decoupling the allocation size from the PMD size is triv=
ial.
> >>
> >> Yeah, we should do that.
> >>
> >> We should probably just find a way to describe that this is a POOL tha=
t focuses
> >> on physical contiguity in some configured granularity.
> > And since it's intended for DMA we could call it dma_pool and oh look i=
t already
> > exists...
>
> Heh, I did have "DMA_POOL" in mind when writing my reply.

which confirms that naming is one of the hardest problems in CS...
Let's try to figure out a good name before renaming everything.


> > Sure the current implementation is capped at PAGE_SIZE for allocation (=
and thus
> > mapping too), but I don't see why that couldn't just be made more flexi=
ble.
>
> That intuitively sounds like the right direction.

Point taken, I will decouple the allocaiton size from PMD_SIZE this in
the next iteration.

I have also followed up on most of Pranjal's feedback (stricter error check=
ing,
compact IOVA ranges, opt-in per destination on the tx path...) .

I am also looking at reducing some inefficiencies (e.g. pagepool already ca=
ches,
and allocations of new pages are relatively rare, so there is not much
of a point
of having a dma_pmd_pool per queue; and on the tx side, something similar t=
o the
percpu page cache to reduce locking costs when a page is allocated on one C=
PU
and freed on a different one)

cheers
luigi
