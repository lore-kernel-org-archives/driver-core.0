Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793991715;
	b=PE1Cy096mgJfz0nRe9gA+hmhb7rtAviZjTAzYymXGeIriPSctIg/cGSnpwqqpvBHNsS2
	 2lcwwpjwQ0fsYRlK2gNgqpIT/8mzhuOxv1OQIsUuy/YDN0b5jWAYno6+4ZJDNM4YazMS4
	 OVMo8gJE1t7UxuURWNhLrFm+3GdlSP97twJ9M2cTuSzunk6aRk7EeciJ5JkGjvbJ4PG8/
	 QuRhQHnoI0nmpwRKfb1+NwcY2696hQ01jYPQIwbFGmeDuOQ0EnvI2hWYByUKHTfM+L2+f
	 hCCftMSdpevWos707A7TEOishojzqqnh+QrriJc5fhGjBonAjBV8lUKXACRoUr8pjzA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793991715;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=cnari2EfkfcqWLrylXnWPpbFbNnmk3zqvy2a0yZnams=;
	b=IlEzfBs+pvflzFbgWixdQp8apsLhJh/efMmRmKcj7a9CWkKu3qdy2ZC27yD9+NdXtEwF
	 h8McHSpjXSJQW8NJJpmby6OEFooRi7pS+Yedyi6iZ7jGfQE56W2rjZzBfppcwgX/7xf/z
	 5gw+ilQLyMfeUYSjiI1XoGyNJjoD0E4BUXIsXg+UkupRqtHSlgztydi21ssoUOcYtCEkj
	 T6ipC4sd4jLeMBYQOodtaPMgXi1A5Ohcy89HvB7UJdD3eqWPkJ5tYvrFg3pLNAD31GcHD
	 hnQLMd/YTwxmhPYB/No7plEm+ZZnKL+AV+jN1DXg3BKE8vtTlj1JEivwCqHzh6kgcTA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=DOP+4z30;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.180
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA54F606A32C
	for <driver-core@lists.linux.dev>; Fri,  6 Nov 2026 19:01:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA54F606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=DOP+4z30
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-535f598d126so31941cf.1
        for <driver-core@lists.linux.dev>; Fri, 06 Nov 2026 11:01:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793991714; cv=none;
        d=google.com; s=arc-20260327;
        b=WGU9onVwNtUcVyChsUcRVpAPGZlCG6F4pDoUwCHeB+rEb8YAaECWvcpkH1dyfWKcUe
         VPK84XZtLn6T57sH/Len1vtO2z3QfsvuEgRy9oHycImuNkpx8hz3YayAnhsYT3KR6SVd
         ok5Zia7owAKB3gm0KC9JTNw8DhsCcx24KM8MmRId1WSHRMfPcx9NyXd2OxRntqzpgWuD
         C0HvCvSPGlnGXxm8uSy0i7SaX9mGiADZxxbxhmhBDsXBTYpopGhhUFl/tUwbLeUICIXF
         E2pn1G8oLc0qZgTVnYH7luJDx3zpxCJ6eJU8Gi5kBHrN0pPrJ/XxjDltTKYuEye0axTn
         IH3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cnari2EfkfcqWLrylXnWPpbFbNnmk3zqvy2a0yZnams=;
        fh=lFAtgcSPT8BEEWpKnal+xp/H4HzZsTTOuUNItfM4ig0=;
        b=VHRdVuXY3bQi7Sc8qglPzQ9xGT9BEldPvGjhPpE6Le8WCQw3w3e6/QZi9izkwY4nLI
         e3coulRVW1fGPJZ1cNnJqzem03bhzc52pI/4LUVEKFs8SnmIDtIiM3OwNli+6i18x+fi
         QWJAgRjsRfty7cAm5VVqOho5HPvDT8c5vLSURIkpbDREySvbi8KYqhhAJ/0EYQBRA9r8
         +ooG5q8EYR7Z58owIvSQg2R4TQ5rvpNK0lnEnvGdJelyUdBhtLkZrlM+KsNFX0AeQPJw
         uF2Ow9szXNi744uqVOZzpbegGU7C/f2+VwImW6eWBQScXOe/x7peTl0E0/na4xkB8gL4
         m+uQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793991714; x=1794596514; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cnari2EfkfcqWLrylXnWPpbFbNnmk3zqvy2a0yZnams=;
        b=DOP+4z30rf55q5ljF7E5l/EcBpC781XG4dOfMjKCdqWxNV0AugoIpB0xvsvBMj+cYX
         53H9qhmOvjS00PlKeHs2s/ZQUqaGNN2oetwigg/doPvNbLRh4Kady29pd5tM+rwpzV7I
         T/+XYB5fvwBobsMJ03lhjWyuulBKC52vvBqM6vejaaG1J82bweQERVpL1MVOu44vypyy
         5yMohxTFcyMW3f6ITsXRU0BfNQZJXuDu/6R4CJZDHABgNz9oiK+EgUe63ufRDqrBs5Tq
         APYLBS0ETRT5d582r3z3F32BAs55LXSnHpW20AIumcVyLRHSNeoTbdGi3kYnJLUn+0Cj
         QZTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793991714; x=1794596514;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cnari2EfkfcqWLrylXnWPpbFbNnmk3zqvy2a0yZnams=;
        b=mQg72J7BVBwUO5t+r8cpdM+dvC5P07Y/a318hDKhNgFYcq9e6IIKlJN0o3oDxY9wHd
         Fe8cXm5llWlTze7Lsashs4RhXbRUERki5crIldZpwXikCOpRIBCRzSD2lzfz+B0FQlkZ
         1b5hSOAfEMb6Lm5Egb4HjUC9MjGn/PFL37IiwAJPB5jJlAeQYo8oHnx371zp0qkwINb/
         v+RnLFagODR7XMIfrGCNW12QexmG3v3A7eGXGk9Ad188XmtR2rkvuekZZhNL5ePEXCEB
         1pvFGHDJHs212+yKi2skNSXWuqSiJG4xFY9GG3f+DiukLk48ZiWNVmzkj8vk/lflLxXG
         hVzw==
X-Forwarded-Encrypted: i=1; AKwUvBzN1EZr0+twAmLxGk0l+Xqb0uTGhy6Q1hq4478+amg0Sru/+GwG+YulumnQne4rhB/7SrOCLEmdNPrvWA==@lists.linux.dev
X-Gm-Message-State: APuU4Z9A4ruqSucoDQdXYHpSwOzRubtNuMFBxR94iuTOg91vjHTTMkle
	siHwBTUApZi4mYtqyCTtDPMKFeMgwaaqZWxrf851VcoUsVjP/ZTtubZaafEUChquDzTU2hRhXY8
	CoCveCDNRs41g4RNznFofzl3USCrcOfPoYdFwyQQ9
X-Gm-Gg: AYBFou12SeyO/lg4D6TfJWK1IUTeZJzMIFq76enrwY2CdvR7Tgz9z64Ehveqdz/+zMp
	al7/MJ/qNHmPs7NmcSRyKH3s2I3CjVmJ67aFX6j/FkverVz+32oahQOc8IY8rc/6sPAgI/ZBOo4
	V8JXrDC2QXGJpxskUtRmaJBVkR1ZTlxQPUK7JXgxmdc4yO921/Zq5kSPsmF5jZX+rm3WIY0V3DL
	vRMScG0NspC99eNCGlZ52VRecux2nuUjqbf1/4eNEryp6VbAIGPDmoJwZfaMt5kmwlhzLl4K65f
	IGTmekGK281onA5f2m2L8sM71eESWBuTdpiYnTHTC92c+6/i6y54ddNo3tOtK7Tn6S2D7ypFj+s
	5zH7+NVp6ybQFaSpoYAKaL49dC6HNfXLWCeP1Ag==
X-Received: by 2002:a05:622a:90c:b0:533:9746:9a86 with SMTP id
 d75a77b69052e-54f5c235197mr4277431cf.5.1793991712760; Fri, 06 Nov 2026
 11:01:52 -0800 (PST)
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261023140107.GC3977851@ziepe.ca> <CAMOZA0J+MOLv+s4PAvsAK1jbasnbQRyHffZw1VEKutH9Vr6ODw@mail.gmail.com>
 <20261023145023.GH3977851@ziepe.ca> <20261103080933.GA4213@lst.de>
 <20261103151021.GK3889730@ziepe.ca> <CAMP57yWvHO0pWCR3-9q1gtwVe8WV4Y6i69trmw+BJRVYf3JB1g@mail.gmail.com>
 <20261106173054.GH663069@ziepe.ca> <CAMP57yU-VhZWXijvwAXcN9=zZ+eWXZ6J1bkHuCJw3ocRaFaV=Q@mail.gmail.com>
 <20261106180714.GI663069@ziepe.ca> <CAMP57yW6Y4g-xM9YTB+MpgxPN7RFeEWhAPWvqrfOoMDEuL8HZA@mail.gmail.com>
 <20261106184346.GJ663069@ziepe.ca>
In-Reply-To: <20261106184346.GJ663069@ziepe.ca>
From: Luigi Rizzo <lrizzo@google.com>
Date: Fri, 6 Nov 2026 20:01:14 +0100
X-Gm-Features: AclHuK8RLl1nJ3Ebb-rbtl0GPWPY_LeKIqNGDlWDxF7jQ269eiN5kMKC-Dmlr_c
Message-ID: <CAMOZA0L3c0zWvvVF9btAxQSox_hQTZP6W1sK0vgYPQ2OMJtS8Q@mail.gmail.com>
Subject: Re: [RFC: DMA_PMD 00/22] DMA_PMD: PMD_SIZE-backed IO buffer pools
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Naman Gulati <namangulati@google.com>, Christoph Hellwig <hch@lst.de>, 
	"David Hildenbrand (Arm)" <david@kernel.org>, Luigi Rizzo <rizzo.unipi@gmail.com>, Joerg Roedel <joro@8bytes.org>, 
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
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

On Fri, Nov 6, 2026 at 7:43=E2=80=AFPM Jason Gunthorpe <jgg@ziepe.ca> wrote=
:
>
> On Fri, Nov 06, 2026 at 10:17:38AM -0800, Naman Gulati wrote:
...
> > This problem extends to generally reducing IOMMU overhead in
> > networking - taking the dma map/unmap cost out of the hot-path and
> > avoiding IOTLB thrashing.
>
> Sure, that makes sense, but just having a pool of entirely normal
> pre-dma-mapped memory is quite a different problem from what launched
> this thread...

Since I launched the thread, I guess I should comment...

I wanted to address multiple problems, in random order:
- IOTLB thrashing
- better security than DMA-FQ
- reduce dma map/unmap costs (both on the host and guest)
- reduce/avoid bounce buffer overhead in Confidential Computing and
overcommitted VMs
- not just for networking, also for disks and accelerators etc.

Now it turns out that one way to address all of them was to
- create a special memory allocator, which distributed ordinary  memory but
  with additional metadata that make it easier to implement large
iommu mappings,
  track lifetime etc.
- hook this allocator into relevant kernel subsystems so that consumers
  could use it with little or no changes.

As it happens, the first version I posted last month was not terribly clean=
,
and possibly not terribly well presented, and had some redundancy that
was unnecessary.

The next version (hopefully next week) is hopefully a lot cleaner,
and i think the best witness is how small is the change to pagepool,
basically "if the device has opted in, ask for that special memory"



diff --git a/net/core/page_pool.c b/net/core/page_pool.c
index b775b6305fb78..e12ba47a20e43 100644
--- a/net/core/page_pool.c
+++ b/net/core/page_pool.c
@@ -16,6 +16,7 @@
 #include <net/page_pool/helpers.h>
 #include <net/page_pool/memory_provider.h>
 #include <net/xdp.h>
+#include <linux/pisa.h>

 #include <linux/dma-direction.h>
 #include <linux/dma-mapping.h>
@@ -602,6 +603,8 @@ static noinline netmem_ref
__page_pool_alloc_netmems_slow(struct page_pool *pool
         */
        if ((gfp & GFP_ATOMIC) =3D=3D GFP_ATOMIC)
                gfp |=3D __GFP_NOWARN;
+       if (dma_map)
+               gfp |=3D pisa_rx_gfp(pool->p.dev);

        /* Don't support bulk alloc for high-order pages */
        if (unlikely(pp_order))

The network tx side is more complicated because, as discussed
earlier, we need to be sure that the leaf device is one that needs
those special dma-able buffers, and there isn't (or I have not found)
one central place to hook into for tcp, udp, zerocopy,
security things etc., leading to a plethora of small hooks


 net/core/skbuff.c                                            |   42 +++-
 net/core/sock.c                                              |   62 +++++-
 net/ipv4/esp4.c                                              |    4 +-
 net/ipv4/ip_output.c                                         |   19 +-
 net/ipv4/tcp.c                                               |   23 ++-
 net/ipv4/tcp_output.c                                        |   12 +-
 net/ipv6/esp6.c                                              |    4 +-
 net/ipv6/ip6_output.c                                        |   19 +-
 net/tls/tls_device.c                                         |    4 +-


cheers
luigi
