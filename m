Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7691C3FE35A
	for <driver-core@lists.linux.dev>; Sun,  4 Oct 2026 09:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791105311; cv=pass; b=nmJC3VBxCq+2Dh1wX9dZFBe3/VxM15ddk6zg+yghrBDD+5QHp3yzsjVapK1geiTWvvtWt/QiHEiCb82iQeh+BqXuFqNJFA3f7yVDms4NwtJ+YwBN/WnZhRilDwHWtv01xp6XgIS49ylqaCpNW+CvrOXwqVa77h9NcfJBEDZNZAs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791105311; c=relaxed/simple;
	bh=t/n84oizsmqf30Qmzu71biJDzzYUFf3OYTLdCk6ENu4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aTt+fto9DO49Wl5mRSSjpR1q6O2BllT6OSAVBsZcvU09HQIyLrpK1ad/8hJXI1NgBYen6rBzMse36dBBpVC4VJcNRtnUMpQgRRpY71Mfi+Ht+7SL7i8Ae4d6AADB0asGWYjACgXps3h/KHgQNHahe2CD88W8a+ISYRx9mgGSf10=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iicZ+ucl; arc=pass smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iicZ+ucl"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cc4aa18f9afso276014a12.3
        for <driver-core@lists.linux.dev>; Sun, 04 Oct 2026 02:15:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791105310; cv=none;
        d=google.com; s=arc-20260327;
        b=gF8OBgbcmIfT9QfbQZCmJeWlyNYSIIggj9l7XP+mRSzlQwz8q5vJsZ5IwhdFdbpKyZ
         7ex6eBWOkQyItkWylHNPLOBZT93Ejtu7uRHGbGAPqoUxkZAp0PvSvyxipo+0q8aYnc4M
         ul2KQFzl2YwLxYOsvFHUwbMJY0P4/4ifopM32GLDhWBCqlN4T4CkXinWy8ccgsdat2cV
         sYacK6/hEdlIfVHp42kPqr693wO2czkDZYHECeyXf305q+5ynSWd2wMGliGYyCQ9Twx4
         vbXjZpJ/EppHsAe24KO7LExz0jyI4ZkYeNKjuP5K4mbGT8oU85HrpSts1+Zz9GopADgf
         /Mjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kaMhgqh0cNyzIJvdM7MdSJL/gkpQL52j+U/jEExbMjs=;
        fh=2xrDtNfttPsBGrLaQfHJtrDlmErZrx/Is/niwmz2gkI=;
        b=K0n2r4HxMW5wffjpEqv5lih/eqkqxLKIjmN07XvhQyUSAHRyyVS1pkBTtYYNp4P/aR
         n/LSS0Y5r0KKcBPL+m5+qscNUkCG4ejhkzWnpLwRIN2VVaSEk+wx5KcRf28BLYfYoqaS
         hcsUxDgBbsLV9JWthVF4Gk2gXVAPVX3rJYKaeqSaoTdCKqKsCOeUUKJ+JKDYzkDzFzH5
         vMPR97wRPvAkR2RaRmZvND5tWt/JIYSZwl7cdcqYp/LWa5fBMtppSKx8BAJ6j+RkqJe+
         tnDCVsQZ0uutWRhJ8q4J1NWEjuiOxLoCTo/+C2HTjKDR8le16XI8RIpHVtaE9Iwyr8JS
         ru0A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791105310; x=1791710110; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kaMhgqh0cNyzIJvdM7MdSJL/gkpQL52j+U/jEExbMjs=;
        b=iicZ+uclc/Lp6YbAIqkFB4Wl4eJRydQ+tTDzsraSStZHJlE7KE8njGEeB6N+MSgWE3
         DwLGacJeqFFJAW3xPSSCpjXwtWFLEQVBjC8zhzyE0xs5wfq5hQjW+/6cHa0jxj7U3tLs
         Mltts3TSIl5TFhSXaNhAT28cUECnOiKZNFk/NmtUDcbUxIChNIoYsW66qMm+wFa/kiJc
         igmpgwXnrvjw4C28G/hWk9LkxYE1y7KYOFeflURnQOOWFRIaakv9YZ8g2VarR8PuO7ox
         TucHwmbPK+KwiHky8zJ4TiLy1qPJqpmnUaGQX3Cn8K+zRxiaXR2cjSshPsRhtre29pCf
         RSfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791105310; x=1791710110;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kaMhgqh0cNyzIJvdM7MdSJL/gkpQL52j+U/jEExbMjs=;
        b=PrfEsUyzL4gmj8R+1p2uOjJPO3KMtHmXkHXsjrvBXRa0SZevMN2NcP71/y/w1qFK6c
         GPld4tmDFPZIpM36XYdAi9JNtZd1xON0ZBxi0KnfC1D7EpIf/EP9LwY+Z92QC6SngXwr
         SRrprSRt/EImxlInIyBkFE6eNw3nC9/8yqgQL+C8R8zTqMENogPF3twPw1eDzKX1QWPE
         +ZgAQHZHQWwSAe4BXgtzpj5uBav5Y0H794prrFKXYe8e5SJbxkilaUwx6qqpOeFJ3gIw
         MBrQVSyq9AbDkmFvxTJitgPZx9yitAe6AdEuOwxzvu0OwEfDxEYlGFXTQWoKxUVuZrDf
         CqBg==
X-Forwarded-Encrypted: i=1; AKwUvBxj4SHh784FyR+ZLJ2e9uythnqS4PGZGQTJ3GKJ5Ly+ORt6FePOexUU/4QeN/YNBTyUZnb2wGPTdlcc9Q==@lists.linux.dev
X-Gm-Message-State: AFq9FYJb5/7KuY0DMDpezGGb4Zebi5TSH7EE62zCQ8yCZm91aUcYYWR5
	8sTnxAQkZdBkRsFyxr/TQvtR9BCLK2GAC6RSag928ecs7q1EVOHVhvJaX5TD/dUY8D52yDHRkPW
	G4UNjQ0ZnyAdJIUcbP/Juz4lM7RLxGPs=
X-Gm-Gg: AYBFou3t4jcvECJOHCEHpFxkvmqMQ2FgAmCPwtL4G/Z7yf6zzl/BsE5pr3BnLMfmasb
	aDMcqY4rsfjxrqQwbDpb4pkzJIKdiST2pVXprdlKb5aQVY1uTChAR3agl9WVFJ0z4z5S+dcQ0m8
	CZBJAYvhKkXAoPmkczDUfDb+7R/Th8Fnl/FUVHAvrS2+hMAunTQ4Jny72JHBtya1DsBFfNiM48v
	sYGZceY6L3cusMHqEdrDcEMNKN4YC9n2IOh6G75F2rasaLw4pyGxL8vS+PztOwsJYA0yEAGLy1O
	gKzqtfYnQBaU0tHejNyyTAQzCCqhZI7a817hAbzAKtm/K6NfAFFPDQ==
X-Received: by 2002:a17:90b:2548:b0:3a0:d651:3957 with SMTP id
 98e67ed59e1d1-3a7873ac66fmr3158501a91.35.1791105309539; Sun, 04 Oct 2026
 02:15:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261003212241.3432303-1-lrizzo@google.com> <20261003212241.3432303-2-lrizzo@google.com>
 <7ce092a4-5c85-4391-809a-3d04b638a722@infradead.org>
In-Reply-To: <7ce092a4-5c85-4391-809a-3d04b638a722@infradead.org>
From: Luigi Rizzo <rizzo.unipi@gmail.com>
Date: Sun, 4 Oct 2026 11:14:58 +0200
X-Gm-Features: AclHuK-h1jLN5HUM25V1KDJrvXlK_1XFkjlYVZ2OmcSjQmXYi39ZO7A1D8RAYWw
Message-ID: <CA+hQ2+ieCiXpnRzv7t003cHKG-YL+jSOSgVO_KavGEkbKfOeuw@mail.gmail.com>
Subject: Re: [RFC: DMA_PMD 01/22] iommu/dma: introduce CONFIG_DMA_PMD and
 metadata table
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Luigi Rizzo <lrizzo@google.com>, Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Vlastimil Babka <vbabka@kernel.org>, David Hildenbrand <david@kernel.org>, 
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

On Sat, Oct 3, 2026 at 11:44=E2=80=AFPM Randy Dunlap <rdunlap@infradead.org=
> wrote:
>
>
>
> On 10/3/26 2:22 PM, Luigi Rizzo wrote:
> > diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
> > index 6e07bd69467a3..1bb347fd9da4a 100644
> > --- a/drivers/iommu/Kconfig
> > +++ b/drivers/iommu/Kconfig
> > @@ -158,6 +158,38 @@ config IOMMU_DMA
> >       select NEED_SG_DMA_LENGTH
> >       select NEED_SG_DMA_FLAGS if SWIOTLB
> >
> > +# PMD_SIZE IOMMU backing for DMA-coherent devices
> > +config DMA_PMD
...
> > +       Costs 128KB of metadata per GB of DMA_PMD buffers, allocated on=
 demand.
>
> Paragraph 1 of the patch description says 64KB per 1GB, not 128KB.
> Or am I mixing things up?

256B per 2MB page, 128KB per 1GB is the correct version.
The number in the patch description is a leftover from an earlier
version, I will update.

cheers
luigi
