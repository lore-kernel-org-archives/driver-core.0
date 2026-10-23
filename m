Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792756413;
	b=mVSq/mM7O2fzZbLnYxGP8fWzY81vUktvQm7P2VOu9w3HnDnC9ctRyZYYLHCNrSEBplLN
	 7LRylrK984S6IvG5+QZeSgv98qNF1GJu08RX0M3GMm8Ve6vddElYnYeHpF6DJEwP76Y2T
	 JvEQ2NU0QANBrKVbfYKL3XWpoBp5qYirWILemqkPs7GOIRJPYGnDxCgTYuEIp+sOCOq1e
	 xgShEYUZZ3R199eYJYm2wL6L3aoo20Smry+8+Fx5IW2q7qErb380baX2fpWNdmltPTI3+
	 h34G1KjQ833GzB6qA/Wc+8Da8tVd8OqLCv4c7bo9gGnTm5xpJTK9csOgZmcpQ+x/8rA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792756413;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=uLj6FN5zzpYaXQgmzegMg+GrSB746kgYZ/YLy03P7lg=;
	b=fL/9AZBgbxkhGDLFU3+dqDbVxjkJb1qTxToYbI2+vE8GDXIrzJRo9L6syrH63XOqccwb
	 djX4fAwKJy8K5iynF37+r90eHUpLAHc+LZyG+NHNIovkxCh8rqvcBYGW37ABInkLjlSea
	 Txm+SbmcE/PmfYxxirhiAXVNdf2uv3KGA1ImQwyTRjlTk9YQUruuuNUEILBKx4pvjzcxb
	 7hL610wIokmSkTyfTubOBNpdgOdLurxdLxAzjw5q+tNTingH8VhTBjBMgW3JNIqr1mvuH
	 QdB3pY1QQu86dq8k/kM6yfoZ58Di69sdGIp1F1FWNh7wYN4Z6Q94gUlqxI4za00wTTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=r1OW0+8V;
	arc=none smtp.remote-ip=209.85.221.71
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B77E9606A31D
	for <driver-core@lists.linux.dev>; Fri, 23 Oct 2026 11:53:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B77E9606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=r1OW0+8V
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-48b00febba3so717776f8f.1
        for <driver-core@lists.linux.dev>; Fri, 23 Oct 2026 04:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792756411; x=1793361211; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uLj6FN5zzpYaXQgmzegMg+GrSB746kgYZ/YLy03P7lg=;
        b=r1OW0+8VjwkPbd8fzj5yP0GrpZTVK5su+WJTQpXiBqq7cdbh8LxHjvzjKaviDdzqAB
         TXWC4Dg2jTnzus2YakupSi0KzZ2pdMoWnL4MOAgCrlenCUPvbEcUjuPyUAa+eMP/qTZR
         j+NUpoeR3VOgPZ4n16k15Fv7IQ81ignlnDG92+ivwn6HrGbkzHnI9Gxcd4K2aTO9o8fv
         jpbmI6S/TElBRub0PcjmPSR9FsGpIreiLYiQpLx9cEdMOg/2gtzz43Z/NonBiAQc63wT
         UOLwJ98m+Z5jLWMd2TnQoI6y+FqFh7N5L9iexnOUIGZvOyAZiwFtXiB9EF2UXWhsIKwp
         YYfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792756411; x=1793361211;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uLj6FN5zzpYaXQgmzegMg+GrSB746kgYZ/YLy03P7lg=;
        b=j6EP4Qx40wNx6M/N5xVL+Nhwo9EXs02m7dJyhOLELOrbe2JNSWT5JjE5NMHKqgnop4
         j4lKPahdcQw+oiIhiokuGGH6tXsKiZeURBDAmrAnUjZiO4jZvDSRjulP5kybv6+E335W
         KEA0H2nN5Pqf2Sg4F7JGPo6twqAboH/hrvTed+Dg2gyH5LPy/pniq2t3B1pkZnbZb/Qy
         Q8nHC1a4IxSMME6cSe23rcQh4m6wFcw/blZDDBNEqBbDSUgQksdmPgkmUPadO9an8BM4
         nMf1emIonjDkUprEZ3R5kvgBQHQ8gKrmsJkJrvUEwXOMriTzp7shrFj6o9IsDKmaSbpW
         WDSg==
X-Forwarded-Encrypted: i=1; AKwUvBytNoNdJsufihSfnBGta3xpq24n1dqd29WCIsNVe8T0Ivf3uigT3wNMiMuvC1EpCKd7joIwp1AOCBYZxw==@lists.linux.dev
X-Gm-Message-State: AFq9FYI0y88U110Ld/qRhIifupVwW3r1V8Y2azgqB438qcRau6j+Syhw
	1/IJgbtFRQY15EUJXO3AXB+a4cLzGCDnOt9DJGmJToNMr/y7WkOM7D0Ql6ipR0iN+z7s1XlkzZs
	m9qDiYILnf/h3LU9wPA==
X-Received: from wmoh19.prod.google.com ([2002:a05:600c:3153:b0:4a1:8915:6ed2])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4e8a:b0:49f:fe39:5bc8 with SMTP id 5b1f17b1804b1-4a211ee9b8amr34064815e9.12.1792756410725;
 Fri, 23 Oct 2026 04:53:30 -0700 (PDT)
Date: Fri, 23 Oct 2026 11:53:26 +0000
In-Reply-To: <atqh41vrlC4xVtaj@um790>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261020-tyr-ioctls-v4-0-704de77da223@kylinos.cn>
 <20261020-tyr-ioctls-v4-2-704de77da223@kylinos.cn> <atqh41vrlC4xVtaj@um790>
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
Message-ID: <20261023115327.1776353-1-aliceryhl@google.com>
Subject: Re: [PATCH v4 02/11] rust: mm: add `task_size` helper
From: Alice Ryhl <aliceryhl@google.com>
To: Deborah Brouwer <deborah.brouwer@collabora.com>, Ke Sun <sunke@kylinos.cn>
Cc: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"=?UTF-8?q?Onur=20=C3=96zkan?=" <work@onurozkan.dev>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	rust-for-linux@vger.kernel.org, linux-mm@kvack.org, 
	dri-devel@lists.freedesktop.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Alvin Sun <alvin.sun@linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 22, 2026 at 04:53:07PM -0700, Deborah Brouwer wrote:
> On Tue, Oct 20, 2026 at 04:25:19PM +0800, Ke Sun wrote:
> > From: Alvin Sun <alvin.sun@linux.dev>
> 
> I was testing Tyr's auto allocation for the user va range,
> and was surprised to see that mm.task_size() is always returning 0.
> It seems like it should work since it uses the task_size from
> struct mm_struct, but it doesn't, at least for me. 
> 
> If you look at tyr-dev, I think it would be better to use Sami's approach:
>   428d71932b6f rust: task: add task_size()
> 
> Sami creates a task_size() method for CurrentTask which is our equivalent
> to the `current` global and then you can see that task_size becomes much
> more clearly the equivalent of "TASK_SIZE_OF" used by panthor.
> 
> This approach also correctly returns a user va range when Tyr has to
> assign it in my tests, so let's switch over.

+1 to switching to CurrentTask::task_size(&self) backed by a C helper
calling TASK_SIZE_OF(current). Please also include `<linux/mm.h>` in
`rust/helpers/task.c`, as on some architectures (e.g. riscv) `TASK_SIZE` is
defined in `<asm/pgtable.h>` rather than `<linux/sched/task.h>`.

Alice
