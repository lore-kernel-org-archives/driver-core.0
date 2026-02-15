Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E3D17A303
	for <driver-core@lists.linux.dev>; Sun, 15 Feb 2026 12:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771159639; cv=pass; b=r/9Ph15LpTVDWe/9/3yaByh2M1rf+RpLBtfTSbP9KN+8sBc5cECqvivaQsvYEyV1JSJIQp8mflg3jfMgaHDtnrXZLqOUO9cDCsPYnzJczegcVWvsSgR0Sq1cXZ3Cv1SQnofJ2tyKzhMXmYA5r/98RJygPHyKrYLsNJFyj8JpTVo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771159639; c=relaxed/simple;
	bh=B4uqGI0KWBIUJL6YDXBlbt8QMQCu/u6x+jYyWmIroY4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=tPKdm0NpMN32OUaoMJXreuU/wevLnSx4XTzgd9+OcLHqDxDtCxtMS3oF79QKY+K6C9mqNg1AifPPHPRgjPfj6KjWWi51/HsADPKq630D+Gmp5VLcKs0gbIluPlZF4f7Y1GKvHAZGQIjwuEdWtDRr94gQ04aR+eQnNkMVw7K7o2E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VQHUx05M; arc=pass smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VQHUx05M"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2b86a9613d8so202954eec.2
        for <driver-core@lists.linux.dev>; Sun, 15 Feb 2026 04:47:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771159638; cv=none;
        d=google.com; s=arc-20240605;
        b=YdU/rMijZ4ZE2FhR2CAOEuPFCD4nHYGBWhw1XhmRS5lPLcdjRhPxEY09V+yPcpi8Xi
         SCIAETWBw1PfUttkRGE4hBOvt6OWr3mEwIRpCVGsG8faklQpFaSxTKvJtLpzaHgfOS2v
         ijenkI4XE1/p6E/fDAsD771Gk33qTtD5uKg0fr7xsewyzAFWa2M+yss8VU/HQSXY2Gfs
         bdd0oNj7wbn6ppNOb5ALLQtgNM1pVnTpEmkhiUmbaQrJS0zbc073Gqg6JKiHzx8QH0T4
         /VGU8THVv7WIAO51H7OcrSCDQdv/YBJ3JFLVI0bt4Mwiy223Kn0P88NvOT8IgUI7LTt5
         2/mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=555QthD3BOi0oKnL9Ait9gVqXQiUN7RsLDwjha1Lgzs=;
        fh=Vov5ncGfUDHfC8J+xSVmlzL1rMeBRuZOaagTdy9veuE=;
        b=cp6hKePzy7d0tESk66cOk59qGYSuOesf22ItSUxZwfCbF+xPBsEriiXfjhqOt3Zpdb
         Qd4++ItnVHFOn/3IM3U4EFKpGOl9/ynM/eC3UH2QZY9wW61CyH4gH9S/1YeoXP5onTro
         JygUo4MXFHo5SKdaJkFOsBsmUHOc76CvtUOlYtiVk/MvEn/6C5wpZ21lhX1BIpd58Etq
         23Glz+2/Ael5TIaErCPFbSQjkdtpX1rBH73iar+CwfQwp8n3MJh2BV3Emt9B2C8GpqRo
         4CSBiGNUBAchboufqG3ggzZEq27ueTpYFrMUF8alDLFRuvK6z1rdkGOasDqspCsc/yks
         f+Zw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771159638; x=1771764438; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=555QthD3BOi0oKnL9Ait9gVqXQiUN7RsLDwjha1Lgzs=;
        b=VQHUx05MU7xGK1UhksY6zb4mTcQzvWf4vmrQv/vqBTlm9YjC4NG01JQfL2L4CSCenv
         RTWQNUuCKlMO9KbFlg6KnkSISoV4u0iP9Wc/HzE4kcVNodjsXkZqN2HoaoPrV+DQVN8L
         M29EcYYxqPXvfcNI6ZvEXmBePdHS2R/9zQvMJkHHrOBtx/8yp8F6VFqicsNtNxGlyVGq
         EMgGTOyGrZzJiusLTTNCt+8jdYmTCZ7aw13pxWbJGWi8/ArHnd+uLvT24eN/srDY71D8
         UJhCY//RjlOhRQM+DBMleaUXadAkLbKwGJqTxWTRlatyDeCUghls2GJPvpPazRJn/Ds/
         TeYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771159638; x=1771764438;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=555QthD3BOi0oKnL9Ait9gVqXQiUN7RsLDwjha1Lgzs=;
        b=CGkdDsjKV1Jj6SaoBv49vlWzYlded1zTrEtWl4lQfwPCHXPh3pS91FBGHv8RWoPGGL
         8INnzP+EsvDaUCfLC2+YD63a2snOzn5dqIb8VtNdsDg5NXw4mdkcXV82ytNdEPL7yfMW
         TF2b1ua10VBVzmjlWJ/CLh78/y8QK5oLhKMQRKQlR4Wrzm6/TudVoAA0m4OqJBJ2ZNKJ
         iM7kUIjNd1uZS8eeuxUKlpZAjx3WP+B3FnGCRqxtTp0fiUIRVgyPQaBWqGz6WamKz/sm
         F/1g65P+D3uprGd8kcWqI7+GEyuLH2ab2vNj5bVWXcGkXnR8siLN5S+lvO53MX8xyAhz
         fXCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJhzbwverQvUYt3/SdVBmTQ5Du3Fipqr2wTTzMMRef3H+dw0kOHd7b4zaJujjoEOrQEJuAhyPtM4+7vw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzBJR9YaLCXYgJ8Gzczog9B+EuYiX234JfAZ13o3NMqUj4TIUa6
	jT3ro0XgqCf0dO7Bs8WIZW0CWv+k+B4zzQJpLFQwFMShcfn3meQtfexuuaQueOQ00wj0RiansdW
	Aj9okcsX0V9NVHIGjNL42zoIA0Rt7IuI=
X-Gm-Gg: AZuq6aIYhyyauEKhEA1Fs38he2Pj0F/ob2YuvR52Dw5Jc+U50DOOKFlOevmIkHEHRXk
	1SUkABWw1SB4KvEC/IlW021Zn3aYL76wQeebI7HFGqZL7yhqpc6oj7WB1dr8K/D+EV3l8dSAPh1
	UApNMoiDgG5W5mZuzJ0ef89xJS3VFjfDtVsP0oOSqhClwRuGuDUKYkDHkuOsTYv+Y8aKlCAzWcA
	GBDN0npnz7yI3DjT/SIm+WhxYaBWqXVy3E10ViP80YDbJSV91ihGiufCf9KKY/UatO0c3OftwkW
	/8GGNqlvlUnJk8qejN1ia1VyYaOMnRw19zoR1V30noPvLEUUvDQJH/QUW5GAaR67ecmLZFJUNQu
	GVhX1p4+W1MUUQNvOOAeyAfuoHSvXi+PfmZ0=
X-Received: by 2002:a05:693c:3747:b0:2b7:f145:a98 with SMTP id
 5a478bee46e88-2baba010c63mr1740180eec.2.1771159637646; Sun, 15 Feb 2026
 04:47:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 15 Feb 2026 13:47:05 +0100
X-Gm-Features: AaiRm52xhFAYmyYTEXemxfhC4DHyUHZ4W6znoAlEOviZgMAfjb63hI2InUlCZ8g
Message-ID: <CANiq72khOYkt6t5zwMvSiyZvWWHMZuNCMERXu=7K=_5tT-8Pgg@mail.gmail.com>
Subject: Mainline UML Rust stable io.rs unused imports
To: David Gow <davidgow@google.com>, Danilo Krummrich <dakr@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Daniel Almeida <daniel.almeida@collabora.com>
Cc: Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Johannes Berg <johannes@sipsolutions.net>, driver-core@lists.linux.dev, 
	linux-um <linux-um@lists.infradead.org>, 
	rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi all,

In mainline and next, for UML with Rust stable (but not with Rust
minimum), I am seeing:

      RUSTC L rust/kernel.o - due to target missing
    error: unused import: `define_read`
       --> rust/kernel/io.rs:229:16
        |
    229 | pub(crate) use define_read;
        |                ^^^^^^^^^^^
        |
        = note: `-D unused-imports` implied by `-D warnings`
        = help: to override `-D warnings` add `#[allow(unused_imports)]`

    error: unused import: `define_write`
       --> rust/kernel/io.rs:262:16
        |
    262 | pub(crate) use define_write;
        |                ^^^^^^^^^^^

Cheers,
Miguel
