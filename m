Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 679C7384CFF
	for <driver-core@lists.linux.dev>; Thu,  2 Jul 2026 10:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782988437; cv=none; b=GoFml81k8DrBdQxMm5enlV+C/GOSRUledzHj3pyTWXy63ftmopUY9KpVcx5QL80r2MPEUWjSXNZRbKQwEdQ9DpKIyXRa3txsqgrJ1N14/fS55ECOB/q6Z4ZV91DDzNrpophXoRmtbXbP3RL1d8xsBsYQj9t4BmLSzmCe6d9Uj9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782988437; c=relaxed/simple;
	bh=NHYOxC/q6w/85rLuoJ0b+7CKB6hCkyDyHdrXzKZNzeQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ES/qUFcJ4FoOCkIOMkNNXO7z0LlIer7yJPO+3C81ejYd3OI0CuvhOVmW/VGwymcHK1E9pqjFX4uM9CrTq/Mq85x0wUHRelgIan493xUbiEBwIp8tpAzaQKr3ul9OiQwj/y7+Z0dXwH8IHdAuU4V0dehn74JwynzRGzrZEdOmztI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=thUL3nO1; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="thUL3nO1"
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-698ac7678f1so711653a12.3
        for <driver-core@lists.linux.dev>; Thu, 02 Jul 2026 03:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782988434; x=1783593234; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=EVZFMgSKrwLqQxBvI+EZbsGquxAKWLQHl8rLAdlBvVo=;
        b=thUL3nO1c+c11islQaGd4X1Krv3nJEbnGs6sm9iNTMjwR29cHlR3sm26SnzBtVOX/n
         dFSFUXUhqhCIem3DSnht4bFmjxMCr5BUO1/mPq3VU6OAhvSKkqLMq/QhpoAHcku1v+LB
         jL4TMn77CAyzdif94qf5TfdUK5NS9eUZn+6sRGfiOOOcrX31e6M76RDVTmqQ1GUWc006
         E+xv4qTcsuwz1Pn3bZI7Znk0dQGPunSQbS7reUcYM/VllpcmA8YcgapMv/HL7QTDUEJm
         XnXiHbe5B4p8LMHme9LPsCd9ieik6OPbBjVjOy92B5BzXRfG/ZDrMnA7YCSmkQuMvXH/
         c/Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782988434; x=1783593234;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EVZFMgSKrwLqQxBvI+EZbsGquxAKWLQHl8rLAdlBvVo=;
        b=FWskkauAnP2HkvqfPF/70HTVJjCI4iYwlXKyPZIBaSVga17AK6uH9k9/vjSHD+V+5f
         kzFF2TZCpg/UZZMGVhRuYCKvFH7cJIrHIM99KN7NOLrq4aWmU+vTcqwxP8Sd3OYVz8j4
         5qoVQKu2hdE+bM0WLf157Tgin5j72Cv9SeN9encvZKvp7w0uAsX0jRNJcY4SY6OVo7fw
         iIfS5Q9GWsF/ayCnr6hmT6dw09U2JvOa5NL+D++DyUAgz/8XfxLlkUOoLxYJ/93YIDd0
         U9JcS7jywJA9RAExw2EkzdEaR2xDbiNTSb66a90mwZTXe7BrwuipUeuWnMDswexfg57G
         +cEw==
X-Forwarded-Encrypted: i=1; AHgh+Roy+ej9pLSvafWNz3ZnBei4sayFQxz+I7s+aXUGN1eII5BjsQLmWpRQoGOj3TgVudmFUW47whBmjPRgMA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxstpFC3r3lHp0IpWuVOiVBlffTr7sJaHVPXrBYmz+0/b5q5LK5
	PzpgpF8l4c2ylFddn6X6JjUMA/ujkc+7MieX/QSRBfR+jc/2hE3qbZPSgCvGsU171aZVSxkooAN
	7meSCu96ESjqHiXoHvA==
X-Received: from edvm11.prod.google.com ([2002:a05:6402:50b:b0:697:8356:d9d4])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:3510:b0:698:5610:76de with SMTP id 4fb4d7f45d1cf-6989f2de56fmr2576538a12.4.1782988433394;
 Thu, 02 Jul 2026 03:33:53 -0700 (PDT)
Date: Thu, 2 Jul 2026 10:33:52 +0000
In-Reply-To: <20260628200304.2365598-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260628174451.2275679-1-dakr@kernel.org> <20260628200304.2365598-1-dakr@kernel.org>
Message-ID: <akY-kHO1o3WgUSoW@google.com>
Subject: Re: [PATCH] rust: devres: ensure revocation is complete before device
 finishes unbinding
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ojeda@kernel.org, 
	boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	a.hindborg@kernel.org, tmgross@umich.edu, daniel.almeida@collabora.com, 
	tamird@kernel.org, acourbot@nvidia.com, work@onurozkan.dev, lyude@redhat.com, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Sun, Jun 28, 2026 at 10:02:53PM +0200, Danilo Krummrich wrote:
> Now that the revocation Completion is in place, also address the
> symmetric case. When Devres::drop() wins the is_available swap and the
> devres callback loses, the callback returns to devres_release_all()
> without waiting. This means device unbinding can complete while
> Devres::drop() is still executing drop_in_place() on another CPU, which
> is a problem if T's destructor accesses device state.
> 
> Make the synchronization bidirectional. Whichever side performs
> drop_in_place() signals the Completion, and the other side waits.
> 
> This does not reintroduce the nested Devres deadlock fixed by commit
> ba268514ea14 ("rust: devres: fix race condition due to nesting"),
> because that deadlock was caused by drop waiting for the release
> callback to return (the old 'devm' Completion). Here, both sides only
> wait for drop_in_place() to finish, which completes within the current
> call chain. The Arc<Inner<T>> keeps the Inner allocation alive
> independently.
> 
> Cc: stable@vger.kernel.org
> Fixes: ba268514ea14 ("rust: devres: fix race condition due to nesting")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
