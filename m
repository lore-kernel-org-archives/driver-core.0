Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5039F3F44D0
	for <driver-core@lists.linux.dev>; Mon, 24 Aug 2026 15:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787585564; cv=pass; b=I884SM2a4s2XCCnA5X3iaIqy681v4i0PktJ1EMt7I1BhWqNUQ74CzwZ2ZMrETnpbRuSvtYeXodw+qNSIPX5UljlVdyrglMtxg9XB3/QlJN780lzQZSslVx4pK9uSxHzxW0nsCs8F9jbmESN+lZnO27eScJnvt5mtSIFPlVD2cqk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787585564; c=relaxed/simple;
	bh=pMin6QXf6mzaFI9tqvtNXTL3PhczVNb4o6Q4NA2CycA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DIxfgqR37tOrVUdrDrs+ofs+iYdrMo+bc1QoOgWvvKmIF/9PvTcZQq3dTvo8ZSU/lj6vGeq2KblFSUubz096JExBFE6T+R2yVKhuH4konkYZ/ejLzDQmIhC1WTO18BahiHb7h6Ibel5Ov0qnKrXnEjF8etXK3baTE0LZY33jf44=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EEGlTzvY; arc=pass smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EEGlTzvY"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2ccdf36f63dso178105ad.0
        for <driver-core@lists.linux.dev>; Mon, 24 Aug 2026 08:32:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787585563; cv=none;
        d=google.com; s=arc-20260327;
        b=dqfD7MCKWFC/WUWR4D5posoxCUMLrNP5ww/Os21zN3B+KO++t0MAW1nrBeDo4fWkGH
         4kLDOa2DSjlE3Yr2uO0yq8xRU93ThYSTwOdhJiBy5OcrgmXA0BEYdpS7T5Xe5ITk1wnf
         ImC4A+QJTj4+nJnq4EkobC8NQOazRctyxN5RYY4aZg5sNxMUNZiC1C8d+VI83n5t50b2
         22BZeHkKzGtYfMXFoxySYZuzI416UPULy02SEUnCJXqsnkwVaUBpnbWjYjlz0LnUVbcu
         Vla2+3Q+rsa9Se1lK7iVMV7S+3KR+O3WPvrnEnWFHiP7uU/DwVKFyFOkKWDxmi790Xmp
         4n8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pMin6QXf6mzaFI9tqvtNXTL3PhczVNb4o6Q4NA2CycA=;
        fh=+ORfseY8oflYFZdUOIzFEsQCkTbb7bMnmbvmjjihgF0=;
        b=kbWOEedksNCAfnaPiM683zk+xFKitt05EL5faHDaDj7Bs551Ol8OtPheJ+lMyDi5lO
         +m/4LQFCbeeG5zHCZ8QxtesmoLrWRb1ajL8WW2L5xoJXeZhGUhoZgUvhKEiLqrP3qNFW
         sRBzoroEZWCdf+cS4WN7iIRcybRKhYiFcZX/plhLTkC3QKkDuS7TpL7Zmsn110WDjEiL
         5GLh+CVLgicPFrTMLaFJV+1emnJMRheNr/3ljz278bwxGhp8Ny/5ldfoGAWQJ3JnQuZF
         1E25PavjuoT5M8lEF4hpXfVgZXc+jDawokfV/J7+6BbtxQqzlc80Tw8vNuA5UgE1P76k
         T6Nw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787585563; x=1788190363; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pMin6QXf6mzaFI9tqvtNXTL3PhczVNb4o6Q4NA2CycA=;
        b=EEGlTzvYWfA/9aZZw6Hu9P6+1+8HXNoOnO6bqDlpI/2S4YNkI8ii73OAkxF9/vJuaq
         3Hr1i8hx0i4jx8DfF9th14+EhgcbG/YhtXwEg8WOO9o8WWXWmRScyMD+fjwOe9lC39G5
         4xeGIZAtON/pXrEZ9WJxk/e3uN9BdhMaeyvpYEE2IUR0V76xj+TTV+xrYETvttqdFL36
         mESo2y+hS335+OL0E0TYZZhPvy4q8iZMVL9Jhej2RAvNvq0XsignXWyWjBLV7CjlyHT3
         ShYA6WH5/prHt/5JCIxZlBSVjrlWpy/eX4JchhQJeHejhp0jJ00bzcu0fykaFve+4qMJ
         8tJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787585563; x=1788190363;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pMin6QXf6mzaFI9tqvtNXTL3PhczVNb4o6Q4NA2CycA=;
        b=QvUzr36UpEwv+B+c1DxFe893Rz/ZGHYxza1ZbbhYz7gCfz73krvj+pqUIJiIvBCJsV
         EdNYLpUXaY6WzbrOC4moYNYhXh7ityEW+Dy+JWfrjgA96nCUIw02bQvISTMuGuXy1tXy
         ZIH9g9b1EU3Rsrokr+AYa4nGScVjj162tFbGEZzV3tGPmZ9CB6dQt+xeyPpFDkscs1/U
         2NeWbTISaRyaE3Tb/OShVcg3e/lV82oCcO0dAGP7JgvKU2d6v9bErmWAyLttSu9qUFc1
         fgXHXoIjFjgZ4QTM1XMXPgaXdrjj9vcn23s4dCVGNRK2I5L9Kl24GjUTcVaEvGMS6LHA
         Bx3g==
X-Forwarded-Encrypted: i=1; AHgh+RrWuX6EmS7GCrxNjHtjl2KAd0uvbyJKpDRuZ4FwYRcYPJka/fKrRFA09/5Pf/M7KfUhASxCdQro+jTMTg==@lists.linux.dev
X-Gm-Message-State: AFuF++m6wGOVzZK8OgNT93o2PyWFprnBBcOFm674hGpCPfu9iDK02P6L
	hMUGOBTKB8oU/3QXZH84D48whw8ZnU+uiJimd/QaNXsS5C+QIZ9UC2iCFMwhCub8ZBeSMafm4SE
	nRxU2O78dsPO/AorDR7rsmFAUwd463d3/XagSpN+0
X-Gm-Gg: AR+sD13KhZo5D02G6nD9SRN9FsBKAsQhR22ojv+pLBooGqa0UzEAHx6P+doJnkS4HUi
	s72zrgVvnUIqSNWU9WUEiEm44LCuGvG5A95wSpKARFFnDcnRItKKZE6hCHREzvvvbuUa5lTAMqf
	dqBl6bdJcabOQjzIn7DicPnYd4SCeV1VcmHHZBNIWtxFDRlg1gnhBksn1Q44dqpV9MCYappTd4/
	5N8v79YEz6WfA26DK49kRIv2eYHcx3pEgrxzNFV3bGCkO/rH8whTzFZqF5atz4jdPEmKRbhhhoM
	L8cFyIYN+N5iwUc8jCtopEsSqB3Lp487Wd8wsq0cKnCaHwVhEORRJtG30vWalA==
X-Received: by 2002:a17:902:d592:b0:2ca:bf8e:360b with SMTP id
 d9443c01a7336-2d673b9e9f2mr10182565ad.9.1787585561896; Mon, 24 Aug 2026
 08:32:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260615234220.3946885-1-lrizzo@google.com> <20260615172535.080cf94f@kernel.org>
 <CAMOZA0KAHKsvA9yRcdrjG13S+=rJhw-Cvnw2WdLjGGY0azG0kw@mail.gmail.com>
 <ajEuUZMgS_NRmDcp@google.com> <ac473a83-c77f-4a41-bc86-8a857d2d6e36@nvidia.com>
In-Reply-To: <ac473a83-c77f-4a41-bc86-8a857d2d6e36@nvidia.com>
From: Luigi Rizzo <lrizzo@google.com>
Date: Mon, 24 Aug 2026 17:32:05 +0200
X-Gm-Features: AcwNN1VGtdaRS1g0BYe1RjEgd2mMtkM251D-YEt_DU0VPfQjcinAUbJbvNKEsc0
Message-ID: <CAMOZA0LJ9qTs+d5Mg9CB1Pio-Kw1HDmuVSMiz=zUZdWFC7zqdg@mail.gmail.com>
Subject: Re: [PATCH] swiotlb: avoid double copy with swiotlb on tx socket
To: Dragos Tatulea <dtatulea@nvidia.com>
Cc: Mostafa Saleh <smostafa@google.com>, Jakub Kicinski <kuba@kernel.org>, rizzo.unipi@gmail.com, 
	m.szyprowski@samsung.com, robin.murphy@arm.com, willemb@google.com, 
	kuniyu@google.com, davem@davemloft.net, edumazet@google.com, 
	pabeni@redhat.com, gregkh@linuxfoundation.org, rafael@kernel.org, 
	akpm@linux-foundation.org, david@kernel.org, netdev@vger.kernel.org, 
	linux-mm@kvack.org, iommu@lists.linux.dev, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 24, 2026 at 10:59=E2=80=AFAM Dragos Tatulea <dtatulea@nvidia.co=
m> wrote:
>
...
> An example of this is Jiri's system_cc_shared heap which is a dma-buf
> heap with decrypted memory for userspace.
>
> > I am still looking into this, I was planning to bring this up in the
> > upcoming LPC.
> > I will give this patch a try. However, I believe that we need a more
> > generalised concept for CoCo pre-decrypted allocators in the kernel.
> >
> There is a talk at LPC in the networking track about this [2]. This is
> exactly the type of discussion that I was hoping to have there.
>
> Besides the issues mentioned in this thread we've also found that a lot
> of overhead can come only from swiotlb allocations when running many queu=
es.
>
> I will add information about this series in my talk. Hopefully I will als=
o
> have time to add some numbers for comparison.
>
> Sorry for the late reply but I spotted this thread only now by
> accident.
>
> [1] https://lore.kernel.org/all/20260325192352.437608-3-jiri@resnulli.us/
> [2] https://lpc.events/event/20/contributions/2464

Thank you for the feedback and links.

Do you have some code describing [2] ?

I just sent a cleaned-up v2 of my previous series, if you want to try
it please use the latter.

cheers
luigi
