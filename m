Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com [209.85.218.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47EB6366DD3
	for <driver-core@lists.linux.dev>; Thu,  2 Jul 2026 10:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782988426; cv=none; b=PpgDZRfUTfAe0Z7DNhHZ0r9x2UW3no0jg1FcGRDOewM8TaxubvVuhnk4nJEOMr66e/wqP0gy11xz/Ir8imTnQbwOBuZRMJWckU5ZUB8sGiFcSzax6r7Aj1JYVYIw7m0ToDB+H/qnoF0DsCZmnwMuPvBXy3xTK3mcjJ2WATu/bLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782988426; c=relaxed/simple;
	bh=dU/JhXcw9C+3bxVyhCk433RwAWlu/+DSj3wRiplg67w=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=sYlIe18u/sPxBafkbKsFGubZ7+rZo6TbP2/w/blcM6Mv3wX9FOK/RMNePZpoArOZ8JNHAke8BXPG5/TZHX2Yhn5UsJcS/IZTyXrFlnrIvXZwu1cGikq99LGhWo41KTdxFYGriP//SNZl1JqB0lEXFHA8lwcX+ueOeqTPePa50Ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rrzV2ZkV; arc=none smtp.client-ip=209.85.218.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rrzV2ZkV"
Received: by mail-ej1-f74.google.com with SMTP id a640c23a62f3a-c126f9928f6so171565066b.0
        for <driver-core@lists.linux.dev>; Thu, 02 Jul 2026 03:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782988424; x=1783593224; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=lSBXWVP6cFuS41+bLzi/68MzajKJS5Rgon/65yIMPQ4=;
        b=rrzV2ZkVSjcyj+FaRfg7eK8VDOYqYC2DzymSuDXuAxsBeyQY4w13dd9lfoYyjMYtUk
         AvuBl8CbRDVU8d64QIILC6fUNGqR14UeIG0/zjPtDNCepjD5mBni5pCY6ur67yfVoqK+
         wghI84fpv7GrYwzC/1h5UlybIGdKUv+XVZ95fdS8QupSdfXwk12Xqj2INVfeXptuwo9z
         /7BSwHPLykIk/U4BggHtsCoaXipxy/r3HXMssfbAG9lRAjVNzlqsLpObygeLczrwigRH
         aMGEcFbgEo5GeDZ6vKtE7p+KN3RFM3SNKB/pG/72o+Ros7uRUJxS+sOHCJ504uq7cZhH
         zWFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782988424; x=1783593224;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lSBXWVP6cFuS41+bLzi/68MzajKJS5Rgon/65yIMPQ4=;
        b=PJbAEqPUiH2yW8ZfP04mrAYD7oafVkMqsE6KjWqGb4qi+QGtaVqlRZdFMj8QQZex0e
         GLblyCz8ugV8WIBppvYhktdTXe8qq8y1lRfsmFd5DvR1gWOnw7rs+At8ixXH8JLkvM8S
         TOspQijgvH1EdWEjJm4zhDydVglYkZGbuUe/vVfCJ7aSbPvbsBF0fmRR9+GVH0KZ8ohW
         0hPUTqEGcMtcS29OP5t9jFuYw1oqbibkJuGhtPT/etfCvipBj5/wi6coOw8cgMTtGR8p
         qzt3XA3IrRYDzRIhxdLPX1JFr9IgJ1IMuLEhvbdntDaQkGwiHiBfs3IMQqShIbvCo3Cd
         yKBw==
X-Forwarded-Encrypted: i=1; AHgh+RpPBenPqnofiJf39XbYuqLiQkUhV0eGTh1HYcCbI3HSedYCXbgo7a658M2ok7dUk4W3zdrBpGGLv7pW9A==@lists.linux.dev
X-Gm-Message-State: AOJu0YyvQL7RMvcHXPt2s/0wuvjrMU4tHS2dWaQ99zKlDbTsQGyWbQFy
	BZmU/YYQijpE0CiZph7n5s3LKQP4bQg8YKJSEd58af/4412M25Y1Yha9c6BMPUDGL1eCLirCN/U
	z8CrQtlluURiNQB6ZiQ==
X-Received: from ejsc14.prod.google.com ([2002:a17:906:694e:b0:c12:4bb6:ec57])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:3f85:b0:c12:add7:b97b with SMTP id a640c23a62f3a-c12add7bc23mr240698066b.29.1782988423378;
 Thu, 02 Jul 2026 03:33:43 -0700 (PDT)
Date: Thu, 2 Jul 2026 10:33:42 +0000
In-Reply-To: <20260628174451.2275679-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260628174451.2275679-1-dakr@kernel.org>
Message-ID: <akY-hn0upJuaeS8i@google.com>
Subject: Re: [PATCH] rust: devres: fix race between concurrent revokers
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ojeda@kernel.org, 
	boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	a.hindborg@kernel.org, tmgross@umich.edu, daniel.almeida@collabora.com, 
	tamird@kernel.org, acourbot@nvidia.com, work@onurozkan.dev, lyude@redhat.com, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, stable@vger.kernel.org, 
	Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="utf-8"

On Sun, Jun 28, 2026 at 07:44:38PM +0200, Danilo Krummrich wrote:
> There is a potential race condition when two paths try to revoke a
> Devres concurrently.
> 
> The driver core's devres_release_all() calls Revocable::revoke() via the
> release callback, while Devres::drop() calls revoke_nosync() on another
> CPU.
> 
> The revoker that does not claim the is_available swap returns
> immediately, but the revoker that did may still be executing
> drop_in_place() on the inner data. This can cause a use-after-free when
> the other revoker's caller proceeds to drop adjacent resources that
> drop_in_place() still references (e.g., Devres<DmaMappedSgt> racing with
> SGTable freeing the backing sg_table and pages).
> 
> Fix this by adding a Completion. The release callback signals the
> Completion after revoke() finishes, and Devres::drop() waits for it when
> it loses the is_available swap. This ensures the wrapped object is fully
> torn down before Devres::drop() returns.
> 
> Cc: stable@vger.kernel.org
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/dri-devel/20260612202841.2577C1F000E9@smtp.kernel.org/
> Fixes: 05aa6fb1c21d ("rust: scatterlist: Add abstraction for sg_table")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
