Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D8F63BD647
	for <driver-core@lists.linux.dev>; Thu,  4 Jun 2026 18:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780599230; cv=none; b=hHXDXhWv6JZOYrFEBXPiETNDThEKm/sKjF5XKvL8efce97GFKj9iT4yfSCmg4bmgUN3+8wx37JJHDreDYizCIC2RcGNVVBv18BtZxkhghvpndXpYT5fsBcSronI/lgyO/fQdu4XQgN41rBLXwm4Oy9hDZND1Wl+cZ0Y5m9PERro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780599230; c=relaxed/simple;
	bh=XsZqKqQ5apgHHhOX9Ab/NdIUELyx46yV4YngdL7eMI8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=B8fW7OBB1IhVEMSL7mCLxVBpC+QEOv4nYzpZMo8/cx9IV67H68Y9EbdjAEtTDpFk7Pg1thPyya8yi9TIPNr5gWjsmK17+uJsGEk4P/LB7t0FnLzFEEGPIGXA8ijHSuQf/0hdWqatQFd/A85wrLBApqHv/Mllhr8FEmntIs2NzIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=di5snAZX; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="di5snAZX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780599228;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XsZqKqQ5apgHHhOX9Ab/NdIUELyx46yV4YngdL7eMI8=;
	b=di5snAZXO+kcuk234ZjHKvIhiVCRlRdCX4HndkXoqWHPRIgeBvz+XqmfQ9QU/eZW4Fsems
	bH77WFvsjnn+p6at1G+ojqkPGrNflA3XlUNQ7zY/kSbcESSOjrnQ/jBnv8j9KI9BfSwMQH
	5qb5WwoSzGmYNGgoXgSs3ZL887p5d10=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-477-nuWDlXBdNGyUUEI3U6uYhA-1; Thu, 04 Jun 2026 14:53:47 -0400
X-MC-Unique: nuWDlXBdNGyUUEI3U6uYhA-1
X-Mimecast-MFC-AGG-ID: nuWDlXBdNGyUUEI3U6uYhA_1780599227
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9158f07f5eeso246234785a.0
        for <driver-core@lists.linux.dev>; Thu, 04 Jun 2026 11:53:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780599226; x=1781204026;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XsZqKqQ5apgHHhOX9Ab/NdIUELyx46yV4YngdL7eMI8=;
        b=bGbBGSS6DWzfYddCRpUds4cM5LYi78naOT0saBzRCaeQNLc+vX0BXuSr7fwjnvlBcg
         0YXp3RSRbB/HdFr4jVZIfU0xgNa9yYxalH7hpVLKqzcUwOh6KvOFkk/V2xjqmiuSgl4s
         65r3No06MrJ5n7A/zpR0BBahCHvxVEQmRHT1mhJMf3GduwGnwcAXs/7u6XpUMqQRKBuE
         Zyrr2L2tYbcHoQl/E8i5E70eE9dsLqzVoojCxLEvVLaCJd/iJMRjNRhq/lTfGfPxGoBE
         sItwTqqaNnMBeN5wdwP7cromdP4ooe1h/x5T87m/GZ1uVL9LHt9VvxbKpoptkXyc3S0K
         Hh+g==
X-Forwarded-Encrypted: i=1; AFNElJ8RW8fko9W4BBeJ/PZw1k5M55JgCS4zveRMK7TWboze+0EHgiWdeaBE+jr9CO2RELj9KYTCkU3y4yWBOA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyfQZNwAKFwx5XAy0CtxZvjH1tFbQnz+x0lMOrnqslPrcDNsAeI
	GmbQEfSIIeUtvghG4idrBdRg5KFDvAGpxUQ0ZyjsE6xfqOKl4VEsMxHTmF8DDTuHmCMJdLYrec1
	8WreQLIJoydlBmmKHtNDxtXcU9aYBDLi7dHGnR1fJuzSE6dVlc+/s30kvRJSkiL6Y
X-Gm-Gg: Acq92OH6kzCHeD4YnPhb5bKgT5hEjZ8yWvTWXidlzwEaMUrzLexQn60cGbxDPMCIO97
	3Kfn38m31Jo8s6HvtLb6Ke0mRLUI7eS6e0YM33LvcNlNpA1KxsmkzHMbd3KCCkWe14nqawz7c9f
	dDFhRbHAeVg1T02x3sc6tay/t76pYVYg7Zn5qSIVsT5Uu2FqdQSPQIeSFFGCIbEiTu6HJqX5I+h
	CT+Ue4V3NJZ9plmQ1AG3cQtbCPBfsQ0Vy06qRPk6n6ZCpnLJY0mYkmHdXfs8cBptoyKj5JSzHRn
	WeXZ8toeQmkk8/LaBpRWUsGV7ILjgPLv7ij5fBUv9paSDwcrSQtEW4p3MgnQmhameA12y6nD5+x
	xUbay0MHXZyEDmiXdBrQlXVqRZhSn
X-Received: by 2002:a05:620a:40d1:b0:915:a51d:5ee7 with SMTP id af79cd13be357-915a9c496b2mr73287085a.8.1780599226702;
        Thu, 04 Jun 2026 11:53:46 -0700 (PDT)
X-Received: by 2002:a05:620a:40d1:b0:915:a51d:5ee7 with SMTP id af79cd13be357-915a9c496b2mr73280485a.8.1780599226214;
        Thu, 04 Jun 2026 11:53:46 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a237330sm683172485a.16.2026.06.04.11.53.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 11:53:45 -0700 (PDT)
Message-ID: <dacbea5b8b7c289cd467774c40f3d888a1f1214a.camel@redhat.com>
Subject: Re: [PATCH v17 5/6] rust: sync: Add SetOnce::reset()
From: lyude@redhat.com
To: Alice Ryhl <aliceryhl@google.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	nouveau@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>,
 Gary Guo	 <gary@garyguo.net>, Christian =?ISO-8859-1?Q?K=F6nig?=	
 <christian.koenig@amd.com>, driver-core@lists.linux.dev, Miguel Ojeda	
 <ojeda@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org, Sumit Semwal
 <sumit.semwal@linaro.org>, 	linux-media@vger.kernel.org, "Rafael J .
 Wysocki" <rafael@kernel.org>, Maxime Ripard <mripard@kernel.org>, Benno
 Lossin <lossin@kernel.org>, linaro-mm-sig@lists.linaro.org,  Danilo
 Krummrich	 <dakr@kernel.org>, Mukesh Kumar Chaurasiya
 <mkchauras@gmail.com>, Asahi Lina	 <lina+kernel@asahilina.net>, Daniel
 Almeida <daniel.almeida@collabora.com>,  Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Date: Thu, 04 Jun 2026 14:53:44 -0400
In-Reply-To: <aiFoUauWYLz-Oyrx@google.com>
References: <20260603195210.693856-1-lyude@redhat.com>
	 <20260603195210.693856-6-lyude@redhat.com> <aiFoUauWYLz-Oyrx@google.com>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: D3ruVkl-7PWswvshvfWeY3LK1o_mtvygnkPYeBQqr8U_1780599227
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2026-06-04 at 11:58 +0000, Alice Ryhl wrote:
> On Wed, Jun 03, 2026 at 03:42:34PM -0400, Lyude Paul wrote:
> > This function simply drops the contents of the SetOnce, given a
> > mutable
> > reference - since that proves we have exclusive access to the
> > SetOnce.
> > Additionally, update the invariants for SetOnce to make it clear as
> > to why
> > this is safe.
> >=20
> > Signed-off-by: Lyude Paul <lyude@redhat.com>
>=20
> This isn't needed, you can just do:
>=20
> unsafe { (*this).sgt_res =3D SetOnce::new() };

I realized after sending this I could also just be using ManuallyDrop
here instead of adding a reset function, which might be a bit clearer
anyhow

