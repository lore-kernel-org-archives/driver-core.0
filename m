Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 921AD30E0DC
	for <driver-core@lists.linux.dev>; Wed, 26 Aug 2026 15:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787758559; cv=none; b=kk/0u3kxwnOlvLPi+JmkeYoOjV7PA5UGJRnnL5r5EjNNvB+ezc+Wv8BpRgYm77kBMRtVT+OBmxl+FuOnghs/pIb4X0Nd5jFcjkutRXHoNEm+kDmmD5skpVKlARL7pHws5AmKUSsx4wA+XabnVS8AlGYT1vktyW9fATMh7nvFSsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787758559; c=relaxed/simple;
	bh=ASVPig2RbtLJupuuu44qrmNIwC0FnZunoekjk+DUNY8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bbjDEo/XDfOgv80A/TzVn6U1nDBYPZ7Wh+1+XdGxhpjoQhCsSerxDsseLAagT1cXEHFhSU0Ip4wXQQYpRyTp1OfElcNeOh2mBryiATRlLTfwROSBZwx7zobg7vE+oS7OUM5uWE3oL3tTNK3Lx1hBN6hJcxYe7YkldiPKlOvRaxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dRgf3GQ/; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dRgf3GQ/"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c2530cabcf4so62108566b.0
        for <driver-core@lists.linux.dev>; Wed, 26 Aug 2026 08:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787758556; x=1788363356; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DftFo5v0HYb4sNCC2CkJoMxRuwrXKdG0zBl21yO9LPM=;
        b=dRgf3GQ/pDoMgua41lobJXH8E+JB+YU8wyrrjdF2CrSdMhKmbF/0ocTqe5rwu3D3nY
         rm22FtK7LE6DPDnp1KcIgWoHoxKMZES+bgkTBXXIKcTwiejRv6g4jsmCdAmR7em3nYxC
         F+VhOsxLZsvD92qqLj16dxJBUrCBizI7DpGhz3JjBnWAiKf7BlEI1uwLrORy4YurnZTh
         AiatkSjCpy1mgBNIMx5QLy5XrOGbIzCJJhxBAlRp4xsv72PAW6j+1HR00fGzAUYy4hbB
         vNnhG8AzD1ChrmGyIj2huiP0tE3NeyIOMm1O9jdRGL2q8IEqnHIfGIPRleuBjIFL9KOj
         8lcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787758556; x=1788363356;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DftFo5v0HYb4sNCC2CkJoMxRuwrXKdG0zBl21yO9LPM=;
        b=X2JuJ+kIoKxbd9C0z1TypGEwlSoAPxScXaiDfvvYwcwIP89LT2ahLS3rf76WLMuz9L
         tMFa3WJMgwc6uFbjEUASoY4n0/kuQP6HtouHNaI01YVXpL6YIN8BhEuiOxWZe6IvxoDP
         P0ZrHKole0Bi7FCVFW4OuZTQDVJ9FTrVSg41XtK1LltvjESFa9jCirZrkxScnI772VAA
         19S8zPtc8lCdynC+6lecmdq5hZiZYPjGeAbLlgfIME5A5xlZt7n9hRETPvK0t3R3R0YE
         3vLAXoP4GbrKmk5N8FvCA1DwmgGMw5iaG6CnV5P+PJnHTybv+Nk6VdT7NjHaSEA+EtHA
         RT3w==
X-Forwarded-Encrypted: i=1; AHgh+RpnodUYP9kQQAjs11ybWAk5D0qpnqP/rC1Jlgj/vNJGFoZQWVaz9pDx4LXCw6/azvGECr9LqXIFq23cEA==@lists.linux.dev
X-Gm-Message-State: AFuF++mEshzsRm/+NYGQtO4rABcx9QpIQjnl5xnBieDVgv+yJiwvj+0U
	nnjNKm8ep5V2ouDNr1VGcHHFWb9Tdw+PsvJ2Qi9rLVOS+M64MDDkcccK
X-Gm-Gg: AR+sD12Eb8SorSp8uoLzJzmYL8EYdQZmEQPy+LQNUEQ5NUeX0BjlR0HATWfIJ3qapum
	uwYNmH/S85G9cuqzV+ED14zlzDZHNqygVzOYdBkKKiMGD43AKc0F/aPQe1A1jMmePNu/YFGfa44
	h78KMYy236usWvMdG0CLcfKpBROweBkH1gjKx0iXwkXtzdSM4MtbM8HOLo5fW+hDE6orb5o0gw4
	Ca/QRixYBN8eIqoS0CpqjXu+j2xd8+I77F1HWd3AeUUqp1zyLeCA8QnONtAogblt6yPv00TXOjQ
	n7K2XvyHKJBiHAMPDWAT3bVBYT81w08f0rz2eY2w5UiuTk1oTn6q9lWGbigkYi3tqpO5I35HTdb
	vtgwKVWnH+pSNU/bNZDO7DI//mQfeH5O/8R8GZM3LcYW9i0pqtZvullzjLEEKcUZr6TWQ6AXNug
	60e4sb2K2aJ/PafuXzXZ6c11vn677VVu6GsOoZl1gKNEHo8Do2JOjwxwQK7w3timrvVDHP
X-Received: by 2002:a17:907:7249:b0:c21:752f:c3f7 with SMTP id a640c23a62f3a-c250bc127b0mr959446666b.18.1787758555453;
        Wed, 26 Aug 2026 08:35:55 -0700 (PDT)
Received: from foxbook (bfk5.neoplus.adsl.tpnet.pl. [83.28.48.5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a72d6dbsm483312166b.24.2026.08.26.08.35.53
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 26 Aug 2026 08:35:55 -0700 (PDT)
Date: Wed, 26 Aug 2026 17:35:49 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>,
 Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen
 <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, Jonathan
 Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Randy
 Dunlap <rdunlap@infradead.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, linux-modules@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-usb@vger.kernel.org, driver-core@lists.linux.dev,
 linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] driver core: add TAINT_FORCED_BIND for when
 userspace manually messes with devices and drivers
Message-ID: <20260826173549.18c8a89c.michal.pecio@gmail.com>
In-Reply-To: <2026082658-statue-census-dc39@gregkh>
References: <20260826-bind_taint-v1-0-52b05f4a965c@linuxfoundation.org>
	<20260826153311.6340efcd.michal.pecio@gmail.com>
	<2026082658-statue-census-dc39@gregkh>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 26 Aug 2026 16:25:42 +0200, Greg Kroah-Hartman wrote:
> > I think you confused 'bind' / 'unbind' with the likes of 'new_id'
> > and 'driver_override'. Try binding xhci_hcd to NVMe, you won't get
> > far.  
> 
> It seems to result in a failure report that people keep sending random
> patches for :(

It results in write() returning -ENODEV.

You can't bind random drivers to random devices out of the box,
you need ID overrides. And then you don't need to bind manually,
the kernel will happily select the wrong driver by default.

Authors of the recent xhci and thunderbolt patches admitted that
'driver_override' was involved in both cases.


Meanwhile, Syzbot also found a stupid write to freed memory in USB
core when HCs are unbound. You may say it doesn't matter, but:

* USB HCs are hotpluggable thunderbolt "gadgets" these days
* there were plans to alter this code so that UAF is triggered by
  hot removal of the USB device, not its parent HC

IMO the actually meaningful change would be to taint driver ID
overrides, because that's the known risky and crash-prone madness.
bind/unbind taint is noise that will be ignored.

Regards,
Michal
