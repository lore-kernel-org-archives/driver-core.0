Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEDC9347500
	for <driver-core@lists.linux.dev>; Fri, 29 May 2026 01:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780016451; cv=none; b=HZogMEGsedsU4VE0oAESDIsnpKOxx4JEcgk3X8WseFbkARijBB9o7tGURIOATShRoJD3cLZoxCJd/xPgPWqcU+0HsZiWSQMtd63kM8AEFrb8y9rElik7/0qJ+6E1GS7whF2FKmN0aZL5XFIE9kbMKMgS4FEQ9oW4NTRUgP9rZZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780016451; c=relaxed/simple;
	bh=PBRO3etB7lPkL1yRU0UjynsOCXgaIULKhqql2Fq7OQM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l1viF08zWmBvj+l4hh7IAPjM3XucCuA8M46bx9LQwRRXwYvTOjIXsNdhXRQYkfSMKZ1oocUa0J07KGHAt0KYUwJhxomeaoR7OnDsah+xivl8TzI6Uiz3VCNLqUiEdtJdyLfV4Do5eBpqfy/cDkiZxQyL+vHtrK+O4hRjjA4kPdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aerX7Q0Z; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aerX7Q0Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780016448;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PBRO3etB7lPkL1yRU0UjynsOCXgaIULKhqql2Fq7OQM=;
	b=aerX7Q0Z6EhKhSONFPCH/ycf+Rz0TcDo1+MtR7mokHJWvcvbLbwkD6vkYZbuFMKY1mD2X3
	UqB+/z2ujaA60sQisfrI6XzilFaUjXd0mFQ9IM+U6b/vgs8k7mSyf0eWgIv0W0Ad9DIm7N
	K+HoRChwHF17jYDQ2ws/qPrvOuGMk9o=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-373-vF-Dfw3_ODWQV0eCtinpiQ-1; Thu, 28 May 2026 21:00:47 -0400
X-MC-Unique: vF-Dfw3_ODWQV0eCtinpiQ-1
X-Mimecast-MFC-AGG-ID: vF-Dfw3_ODWQV0eCtinpiQ_1780016447
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50fbc70cfbdso135566961cf.2
        for <driver-core@lists.linux.dev>; Thu, 28 May 2026 18:00:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780016447; x=1780621247;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PBRO3etB7lPkL1yRU0UjynsOCXgaIULKhqql2Fq7OQM=;
        b=HHtvRe/ZypLRd3lEk6ZR2kPGO4JOWvrD46BfHCj8Xozs96mXBMwV9Ms98thkvNXhp9
         iZpJ8V2B6j1LjIFiMBHaFNo35MmvZAi/TShy7fynV/IQBkvACkf6gNZeO2GAXr8EpQit
         k8VUmwU6KvVCniqZJnCeMI6Z8bnRqUek+L2N+r0dto0++UTVUmvLH8YqcFB+mgnM3ZSe
         4rUq+xOx8rUSfnKEyXZiXP2eRT2uzRg3e1YomEb8SP8evWPG9vCjEONIIcG5L4ZDHIUi
         pcpNLOBNJ7I2Mj3B6P6e6HW9cK4dGRcOmUn6VDxhbn5dyrfICuYceqyVwkwyb8ClxxkU
         k1Cw==
X-Gm-Message-State: AOJu0YyTu1KDgy6LUF6vRBy37f5sfaxlAaseP9o/voqtY8XtGVvfAYUu
	/gZwbZf7uH1UyhvJ1Ht+SXJPU5S245Hi5skn62s6Gi1Ya8KKgSBm2BqrxwtHATwR6VysJZVS6e2
	G5KXhk3X2hL0VH+C0BFUVtioW/fwvm7MGtu58nqH7C+PNzPbF/ssr1sT2sDeku8f8
X-Gm-Gg: Acq92OGHNZ9XgjxEVHyikmW7FE+0liPDeEP6HqxcCZqWi0BVGTBd5+k4afVkVTo2oHD
	qs+VxpM3poMjVZjLTYzgBnPqshs7czt4NIhtVJPMVjkFm6jA91D1rApXO16RPQwQ8Jod29TIp2g
	SmdVrR5ILrfECfIdPe4qdJUgusmiYPELb/vFGBX1C0vBICEyUHjMSEpPD/F9VjqUUd+UeznEgTo
	k6iRNlA1Awkv3BfANHTRwbD+95VgoY2vykWqetA8SpaJCk5DTrsF+5uDdwvw5HHqBGJaZOYkIvp
	bVgS3PQL/uhe5tWbMyr5IOi5Ig8LQtD/FLfUOdxLu05eqy9jLtZY83/ULRbDFPD89/hEMw2SZeF
	Z+8lue3/t6lpGlJFertb2aAJZIaqF
X-Received: by 2002:a05:622a:1b2a:b0:516:dc50:a01a with SMTP id d75a77b69052e-5172dc1e44dmr12442961cf.5.1780016446491;
        Thu, 28 May 2026 18:00:46 -0700 (PDT)
X-Received: by 2002:a05:622a:1b2a:b0:516:dc50:a01a with SMTP id d75a77b69052e-5172dc1e44dmr12441761cf.5.1780016445788;
        Thu, 28 May 2026 18:00:45 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5172e9a5034sm5068741cf.6.2026.05.28.18.00.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 18:00:45 -0700 (PDT)
Message-ID: <066ef2f147aa7b568d31983b8ba4427c3eeeaea4.camel@redhat.com>
Subject: Re: [PATCH 3/6] rust: drm: Add RegistrationData to drm::Driver
From: lyude@redhat.com
To: Danilo Krummrich <dakr@kernel.org>, aliceryhl@google.com,
 airlied@gmail.com, 	simona@ffwll.ch, daniel.almeida@collabora.com,
 acourbot@nvidia.com, 	apopple@nvidia.com, ecourtney@nvidia.com,
 deborah.brouwer@collabora.com, 	ojeda@kernel.org, boqun@kernel.org,
 gary@garyguo.net, bjorn3_gh@protonmail.com, 	lossin@kernel.org,
 a.hindborg@kernel.org, tmgross@umich.edu
Cc: driver-core@lists.linux.dev, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Date: Thu, 28 May 2026 21:00:44 -0400
In-Reply-To: <c393d06629007dc9fe76224d7b8a594b10c07edf.camel@redhat.com>
References: <20260506221027.858481-1-dakr@kernel.org>
			 <20260506221027.858481-4-dakr@kernel.org>
		 <b1865396f13f67b600f3548caa8ff907cfee9403.camel@redhat.com>
	 <c393d06629007dc9fe76224d7b8a594b10c07edf.camel@redhat.com>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: h_Mq5ZR8yz5fuO6YsxkthA200tDRVRiVGejtDe9rFE8_1780016447
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2026-05-28 at 20:15 -0400, lyude@redhat.com wrote:
> FWIW: now that I've noticed this, that might simplify things w/r/t
> what
> KMS needs here from DeviceContext and allow me to go from modeling
> DeviceContext around 3 stages (Uninit, Initialized, Registered), to
> just 2 stages (Initialized, Registered). The purpose of having a
> separate Uninit and Initialized had been to workaround not having
> access to `drm::Driver::Data` when a driver performs an atomic commit
> before userspace registration, which would be a big ergonomic issue
> for
> implementing a lot of atomic KMS callbacks.
>=20
> But if that's not an issue with this patch series, then it probably
> makes more sense for me to respin that DeviceContext patch series to
> reflect that since that simplifies things a lot for the KMS side. For
> your patch series, it just means you have to replace "Uninit" with
> "Initialized" in the next version.
>=20
> I will send out a respin with this tomorrow after working on
> respinning
> the gem shmem patch series, since that shouldn't take me very long at
> all.

Actually - after working on it a little bit more, I think having the 3
states (Uninit, Initialized, Registered) is still going to make sense
for KMS. So, I probably actually don't need to respin/change the
DeviceContext series from how it is right now after all! Sorry for the
noise :)

