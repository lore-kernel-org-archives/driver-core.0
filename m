Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A87431E859
	for <driver-core@lists.linux.dev>; Tue, 25 Aug 2026 07:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787641411; cv=none; b=M7VMSk9Jl3+xFaAyJZK+AMne5t81YnxcJTacBOsApjI837g4o62ous6wozXZCJk7nyzZBt8EwQN48w4GYBWr2+hqFztQ7HSbDqp1EeVwrmOfzBneWelWKI2/wXFU6+eRMC+lWZ3v0Ki6EVP4mlXBUB4TJL5gI7TyEpZvLm7aaxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787641411; c=relaxed/simple;
	bh=LOf+RtJBXhs6s/eIJdx9ZRDZnUklk3vYSZNk0xKtRkE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lk4JouoFUoaYAQ6GCSBhH+b5xmejzLfH25nSKCtfxMpV0zNQ61J5evpZKjIEYYNedUCWt3/rfFLovmNuazjuqKLOfxYwYiP/GVy/wSjeVqpIihoWhiCgoS8vqkIyltQhjs65GPEJ/Pw079tS58JvubG20MvpGejYHYs50D4akzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n/gXuHoS; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n/gXuHoS"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c15cd3fd760so530602666b.2
        for <driver-core@lists.linux.dev>; Tue, 25 Aug 2026 00:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787641408; x=1788246208; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CMzGm+i1YzxWvRFmcCkLX0OTQ3u6nTrGUJ+DECAkF1s=;
        b=n/gXuHoSIDVoWu9Cy/1DzOqFc/s15fKJa0JZdlgBMkQHLlrg1VQ0AlcjtoDDMCN97O
         yw6Rax3PA8OwR8HdaVppt+Gt/AbdmySmnSg/sjwzjkYmNo/SlsZx/AH0pzoacd19MCGP
         3cTA8qy0nmX08rpLEylMF0jEaLIz8FktCx/A9iFzAum5nenq4F/KRptQTha4J98LSWzU
         m5+GAzdAp8UHYhthP44xDZ41k8l/IKDkKdVmFvZ3yH+BoT4Y9KjdUuKm7LS1791jfT/9
         D5es2av+gm2rAxhTpSqJGtVfxGmfZddrNXOYTkx5GZigYEb+qYxZI5K44v5grA6HreAw
         cw2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787641408; x=1788246208;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CMzGm+i1YzxWvRFmcCkLX0OTQ3u6nTrGUJ+DECAkF1s=;
        b=NZ4EUq1z7cDejeLY6CQSRaYJeXD4ZnAAaS6PvZxid+k+MqVhIV+W+iPBeb3k3wof3M
         pF4Exrxk9Y25orkozJVzUJavnG42l5JVGOnrt1bsifEGgjYjKEPrx/cZlaFjPOHImaE7
         k/Bozk00ADEN+3+2o9KQKjlBvT1o0/qXLjhgAbnKl5h4ZrVes63/kUXPERmeZuggg3sS
         oq+MVr9fwujUyJ+0hqPjGP7gLP+BSbVY7WavGJ8dH/iiu4I4stBpCX9y0879CTlP700L
         fC2vgqnOYclU5wdFSPspCgXp7NzoHzI9AZlDDStf/krTr5Q/3A0rYtsyWg2hRcsz7/pg
         +xfQ==
X-Forwarded-Encrypted: i=1; AHgh+RoFBTH2bmu2MkKdFm/DyESIrWXXsd2Z4LarxJCPXXOKpBZDjjbjx8K1+ek63ffM24xTJixwzyE4+Eh3sA==@lists.linux.dev
X-Gm-Message-State: AFuF++laQZ0yDe+qME1tp4uNn0gBpxd0HNWF0WXlQX6b9ryRvaKAT0u2
	iw6eNtDgbUUuo4YqMh/qshNZU+N5e6PWpY104kzlyBkWFjTys8aMIyGB
X-Gm-Gg: AR+sD1137OD5yo+HLACBRa/ySUZtMNnjn8yKuQb3P4qCDhTThttp74+JGBmUdLVXBwT
	872T2t3a0LypHBEhBnNOQeEwQEWo+GYbdSb9GLQW0j7D/aQy4/DLGDIo2CLS/a2FriADhXNBjvB
	GgrP8ViDS4KvdplTKDhBm3CyHqO4VYTRjl5q3i7NKpFWhERPlTJYtJDK3zIEIystLG0gSJTU/OG
	QLdnk5KYOkT8WBHs4SBKlpsy9C+LSY6xmK/NtS81UNzR2PYcxBfM4N74J35x0bo6n/zBdxAehpQ
	Ex/46nK9iYGEZ254lsh/pYUzjWGJn5KB3+xHIFFtqdOCqNU0lWz9vYy0kuPb8JPibYiKfYO4Y8I
	h2K/kevnQNKPv6jvN2rZqaeOUmxjmtGk/kpvpFj9+sx0HHzp9Xg/+M9LQHJHK4gvONu+cDL/Bh+
	Zth96HwKf/vPFgrbcC3jRWVC2ru4yeaUhJCgRDiBHATAIsl9etBz3fYMal08a3SAWRPqz9gGaXN
	7/GijYhI4j2p5FILRD4oK6ARycSPO+PLwlpfP9NekInDQvudNVkCJrG7Ootytx7aKOuLZ+Kf5zw
	GhHW1xVEXQape7zkDU7JgeFTG6qAC7+08jcsKwzY9EctXldnQ1g0Y6wNH9TEEtH5ZLiwHevdkZj
	G
X-Received: by 2002:a17:907:948a:b0:c1f:922d:34c3 with SMTP id a640c23a62f3a-c24926a1c3dmr2295180566b.14.1787641408067;
        Tue, 25 Aug 2026 00:03:28 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-af54-b201-7419-a557-62e9-4d13.310.pool.telefonica.de. [2a02:3100:af54:b201:7419:a557:62e9:4d13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24966f64e0sm1897627466b.32.2026.08.25.00.03.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 00:03:27 -0700 (PDT)
Date: Tue, 25 Aug 2026 09:03:25 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Matthew Wilcox <willy@infradead.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	syzbot+9cb1ac7fce4944ba9165@syzkaller.appspotmail.com, stable@vger.kernel.org
Subject: Re: [PATCH] klist: avoid accesses after waking klist_remove()
Message-ID: <ao051-T1sSobzcXP@gmail.com>
References: <20260825040408.59225-1-kmehltretter@gmail.com>
 <2026082559-cyclist-annoying-7a55@gregkh>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026082559-cyclist-annoying-7a55@gregkh>

On Tue, Aug 25, 2026 at 07:25:48AM +0100, Greg Kroah-Hartman wrote:
> > to go out of scope and its caller to free or reuse the node.
> 
> But does that ever actually happen?

klist_remove() waits until the node is removed so the containing object can
be freed. bus_remove_driver() can later free drv->p, while device_move()
immediately adds the same node to another list.

> > The task reference keeps the waiter task alive if it returns and exits
> > before wake_up_process(). wake_up_process() provides the full barrier
> > required by the sleep/wakeup protocol, so remove the explicit mb().
> 
> I'm confused, what actual bug is here?

I found this during a targeted klist.c review.

Only later I cam across the syzbot report. That report became too prominent
in the commit message.

klist_release() sets waiter->woken, then reads waiter->process and later
writes n->n_klist. After seeing woken, the waiter can return on another CPU.

My initial KASAN reproducer was klist-only. One thread held an iterator while
another removed and freed the object. A delay after the wakeup made
the race easy, hit KASAN on n_klist in qemu arm64. 

> > Closes: https://syzkaller.appspot.com/bug?extid=9cb1ac7fce4944ba9165
> > Tested-by: syzbot+9cb1ac7fce4944ba9165@syzkaller.appspotmail.com
> 
> Are you sure?  the whole bind/unbind mess that syzbot is throwing at us
> right now is really causing people to go down odd paths in thinking it's
> even a valid thing to consider at all.

I did not verify the dummy_udc bind/unbind sequence. The klist issue
does not depend on this USB path.

I can reword a v2 around the generic reproducer. anything else I should
investigate before sending it ?

Thanks,
Karl
