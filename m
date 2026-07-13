Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE073A6407
	for <driver-core@lists.linux.dev>; Mon, 13 Jul 2026 08:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783930635; cv=none; b=CzUHQI8k7rBQ1cQm3Xgn3/ks7RESPEfI+5bGr6KzQaiiB2NvaT7XknJKohjwUy9Wy7bAlA/hXDhfmzrDHGI1Wm16hgUyAM08PzynGAoGErIyJSJ4Evul2IjMj2Q0eHWwQJz3uyWlUjHdWYw06VF0ka6eVFW2zKY+OABX/gyuavk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783930635; c=relaxed/simple;
	bh=e7biIQWq4ayHoPrEIMSf8dlPvUrUBRV5RYriupriJE0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=loAZ53sOChVVuD1uSB59qEt1ENU+3YntEAe33XLwz6qNASYbY9OQrdbN4s2NhD5G+IZueNMKTBLytYlN5CbNTM1sSraAuTtS5/cT2WX/cHAzjaEvwEYq3/CKaSWGHYxPvYxKMO0kn+qgqXDr6SG/H/MiVwVORah/8Wm+4u6hby4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sSfySp2d; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sSfySp2d"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-493bfc3b84aso12924655e9.0
        for <driver-core@lists.linux.dev>; Mon, 13 Jul 2026 01:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783930631; x=1784535431; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e7biIQWq4ayHoPrEIMSf8dlPvUrUBRV5RYriupriJE0=;
        b=sSfySp2d5q8LIwpjsYDXXEp4U6IDQDKMNby0ypDUVXUSDfGTTDo/nXMYCN7N8/2W0a
         7amf6X9TMuAB/V+H0JsWYcC3ogYoklqyjthZ1Wfqy8riviASrhN6RkvZC7oGDS3LbhQR
         78rxSI4ZqJQvbIuK0ekYdafeJf9Y/h0wmPoDNeYsbSNem/LuvTkM5xMlx+Xb4Mz1msie
         G1/s0xy5spKv0utUrrVmzHtDiMPgoJN2CwsnSS+QLpUcN5fIX0FWY0CIWEPdyhfxlO1+
         BI9gnaAP9ebzw27o88/RYPJAyaBo4SdDuBXibVN/ROrb5iT4xZMpD33h0ezafg2xg8Bb
         xOTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783930631; x=1784535431;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e7biIQWq4ayHoPrEIMSf8dlPvUrUBRV5RYriupriJE0=;
        b=jibMIqNLkOI2qquaY3uAOZLje4xGHO6YP0G2k6azzAB4t4dDKPKPF3UGJbS0OQa1Pr
         6gD357JTebzBtJOmoguFUscQqZF5W+kQxEEK4KHfwjDuIp0ZZy5+QEg9EaGLgIUOIP5x
         GC2snTvh96zsBcaw3dCqx6WX1G0pU5GCMUENfxTEpA7EKZ4mHeJDY/NWHL5vzVtu1+XA
         Y9HDhXANRY6NuDrvIJKe6yE9Uo8763M9nxo/677qw757DKpUQcHRTmUX0uiJCZOhU+f8
         2VwO546mKFdufIdBUYcb7E+Q5/Dc0H5fX1dfltWILZqJRxDn6DjxsSHrZzToQ4Qdn/o5
         ibZQ==
X-Forwarded-Encrypted: i=1; AHgh+RoDUCvkedaQ6VBVPYpnGclH7XR+Qvsoh33A9Z3SQlrbCBO8JaBAHg5f2sq/OKcR7lM8SoKIQuJz5rJCTQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzhaISnBDdXKwrglFElfOlsfn2fG7ShgnVkawzFOc86weKoEYrs
	2yDOgrBnkasKCJ0IdBAgxVQG3IFjcqhn/ZOg0oUAUunyH5if7NgNvnbVzZycPsqdtmltTHnU6yx
	alsjwz8DC47MqjEns8w==
X-Received: from wmpu18.prod.google.com ([2002:a05:600c:4d12:b0:493:f522:9fbe])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4f91:b0:493:72d3:4a81 with SMTP id 5b1f17b1804b1-493f87e5bd2mr75050475e9.16.1783930630723;
 Mon, 13 Jul 2026 01:17:10 -0700 (PDT)
Date: Mon, 13 Jul 2026 08:17:09 +0000
In-Reply-To: <20260713-fix-fops-owner-v8-0-2495cfa82d47@linux.dev>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260713-fix-fops-owner-v8-0-2495cfa82d47@linux.dev>
Message-ID: <alSfBXoFjX-W_Ch1@google.com>
Subject: Re: [PATCH v8 00/10] Fix missing fops.owner in Rust DRM/misc abstractions
From: Alice Ryhl <aliceryhl@google.com>
To: Alvin Sun <alvin.sun@linux.dev>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Arnd Bergmann <arnd@arndb.de>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Rae Moar <raemoar63@gmail.com>, Breno Leitao <leitao@debian.org>, Jens Axboe <axboe@kernel.dk>, 
	Dave Ertman <david.m.ertman@intel.com>, Leon Romanovsky <leon@kernel.org>, 
	Igor Korotin <igor.korotin@linux.dev>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, 
	"Krzysztof =?utf-8?Q?Wilczy=C5=84ski?=" <kwilczynski@kernel.org>, 
	"Arve =?utf-8?B?SGrDuG5uZXbDpWc=?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, 
	Christian Brauner <brauner@kernel.org>, Carlos Llamas <cmllamas@google.com>, rust-for-linux@vger.kernel.org, 
	linux-modules@vger.kernel.org, driver-core@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, nova-gpu@lists.linux.dev, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, linux-pci@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Mon, Jul 13, 2026 at 02:45:21PM +0800, Alvin Sun wrote:
> During tyr debugfs development, a kernel NULL pointer dereference was
> encountered after `rmmod tyr` while gnome-shell still held /dev/card1 open:

I left a few minor comments, but otherwise LGTM.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
