Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC67257845
	for <driver-core@lists.linux.dev>; Fri, 12 Jun 2026 18:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781289578; cv=none; b=CEMz4h75iJUt2pIB7vGGBkCVKWcNAnYiAncaIx1QKxi6DrXjfx6FYu/+7l7MTcaxjUo1yjejLG6t/ymnuU3sWDQ1fTb4Hbb+hxOeJkrOX9UkgLJLYzAXvdI6d5H1m7qBoloEI+0rz56dlz2TRXqsBkKP0DYctJzmDLgrJpBuEOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781289578; c=relaxed/simple;
	bh=9hjvIQdDCosfn7FQViIiZN3fmJqSK0XtflTNuA4kTRI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UWxwdZ82Q0kobu8gLFqLOLgR2wEUSbZ2zeZCDloqIky/ZM2FkDuRJKhy2lPhI+tqMpPsjLkka9f+r+JJ4jCL0KA1pAD6OlTsV0Qb44yVlye8snhfpBXMLKnITBMPBa3sX+kjOuVx2gZj+W+2Z0ReKg2ip7nAGWD7MnYneCobd2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DapDo0l4; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DapDo0l4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781289576;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9hjvIQdDCosfn7FQViIiZN3fmJqSK0XtflTNuA4kTRI=;
	b=DapDo0l46bQWYM4aUx+pyvP/ieQNyTxQGFd4i3Xw9IPL4LnTN5A3O57UZnlW9/5VBPqIWi
	TauXKGqzHK1tjQ+ay/4vn+iK+XRcbRxHAoMVXRt4e16so2SKqY/sW1ul0g/rBPm4LL8j6W
	nyu4ql2CKFJ3Qlu2e5vROoFhtJ5Fcn0=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-21-kxKoi-FcMfmxTPuLKK6rzQ-1; Fri, 12 Jun 2026 14:39:32 -0400
X-MC-Unique: kxKoi-FcMfmxTPuLKK6rzQ-1
X-Mimecast-MFC-AGG-ID: kxKoi-FcMfmxTPuLKK6rzQ_1781289572
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-915767b341eso119468185a.3
        for <driver-core@lists.linux.dev>; Fri, 12 Jun 2026 11:39:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781289572; x=1781894372;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9hjvIQdDCosfn7FQViIiZN3fmJqSK0XtflTNuA4kTRI=;
        b=DMMuz3jzcOv0MvVe6MQv6ow7vNnuBfFswa2sDnk2cY7HQ3h2Ocw3jZ4eGt8qPtdIrJ
         XdSXGkeQ4m/CICLyfPnBey/wo+JhAo210kSCuZyJMQ2ce/LC8zvHiKjx+jnga1Z3u9qr
         fv+X9nWUVZaASpDVtTvckIcYmDsQZKQWJDqIYnxXwwZheprdeDAgLjiXMwOvf8cotj3K
         8THLHqG1DnZ8ZFbHi3/rHjGNqXvPWY4KijQaGCHxkB4M8SpByQx7LILHMLeVIlEPBKkp
         r4NIfVb3uSqmN4Z0D2uKyXYyRUxA3kBzcM8UN2vvY7nx8N+02wJeQ6k5/ytQVe9yeYtF
         j+/A==
X-Forwarded-Encrypted: i=1; AFNElJ+a2liXsSjfL8X84hehpfJt3nYvIqTsuguHjg7xtOez9JoJEMnVcDQzj5MOUIfjd1P+2VyW5b4GWt1x5g==@lists.linux.dev
X-Gm-Message-State: AOJu0YyHV015Kr5ERnxpnIkfQrt9wTS5lVDDZ2VpHvKyc+409DyDXpcO
	bpzvoAWBjHC++puUYqm5RDUMe0Eiaj8F68SLIDEfLG+Zc8M7UCH4V0BtM5ZDTL0LqlWLye+uTi9
	rjVlHcsn4AaelblJ1ZBs8QADlQoh+3gW0CzM0TI6YTmBpH4v9E1AyTLbfD0Ln53Hy
X-Gm-Gg: Acq92OGABNT2gzuwNyvqAgrQDMEdciATC5VmC3tUwPNkblOhFlHrZHWdsNumZNtopPK
	RJKBDM2e2LfDxqtl6R6ilHW/ZlCSnabQso7CwGZhf/vyyqeLlqEKzTpM+EfhyUAPRiT/lxSekYd
	4cW5qecZiZIFPw3r+L6Nm78BHeKcmLAOcMBAVguX1vGjXgMWZxM3vtGnXx0b/37qBWfNF/6Zq+y
	gSDvPJiK0SNgztyM1/4prx6BHihDke1DEWeP7nnBdpcoj2mrMc7/3Po3cg432G+K8a9wZIWBMX5
	dj8oVhtHr5NaXsbhyeywRPK/ZECVdb7yRdhDNM56mIhnPP32mU9GeVxwB59k1dJEIthUvGLaRAj
	y9hRovXhtK4MKp5B0uQ==
X-Received: by 2002:a05:620a:8012:b0:914:c032:5870 with SMTP id af79cd13be357-9161bd604f9mr617289185a.38.1781289571989;
        Fri, 12 Jun 2026 11:39:31 -0700 (PDT)
X-Received: by 2002:a05:620a:8012:b0:914:c032:5870 with SMTP id af79cd13be357-9161bd604f9mr617282985a.38.1781289571521;
        Fri, 12 Jun 2026 11:39:31 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9161a03d6fcsm272275585a.35.2026.06.12.11.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 11:39:30 -0700 (PDT)
Message-ID: <da0dd5cf287f8739d6b099646b3fb98153670f3b.camel@redhat.com>
Subject: Re: [Linaro-mm-sig] Re: [PATCH v20 2/4] rust: drm: gem: shmem: Add
 vmap functions
From: lyude@redhat.com
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	nouveau@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>,
 Gary Guo	 <gary@garyguo.net>, Christian =?ISO-8859-1?Q?K=F6nig?=	
 <christian.koenig@amd.com>, driver-core@lists.linux.dev, Miguel Ojeda	
 <ojeda@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Alice Ryhl <aliceryhl@google.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org,  Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org, "Rafael J . Wysocki" <rafael@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard
 <mripard@kernel.org>, David Airlie <airlied@gmail.com>, Benno Lossin
 <lossin@kernel.org>, linaro-mm-sig@lists.linaro.org, Danilo Krummrich
 <dakr@kernel.org>,  Mukesh Kumar Chaurasiya	 <mkchauras@gmail.com>, Asahi
 Lina <lina+kernel@asahilina.net>, Daniel Almeida	
 <daniel.almeida@collabora.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Date: Fri, 12 Jun 2026 14:39:29 -0400
In-Reply-To: <airp4AHxiJKWn5tr@um790>
References: <20260610162433.923550-1-lyude@redhat.com>
	 <20260610162433.923550-3-lyude@redhat.com> <airp4AHxiJKWn5tr@um790>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0_ZsOi7qd0kClcf5j2OiSoVrZvlxgwWQ98N86JKlnWE_1781289572
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2026-06-11 at 10:01 -0700, Deborah Brouwer wrote:
>=20
> Hi Lyude, i've got a clippy error here that "into_iter()" is
> redundant
> because it converts a Range<usize> into a Range<usize>.

Yep, that's completely correct! It looks like I was running my kunit
tests without WERROR and CLIPPY by mistake, which would explain how I
missed this :).

Will fix in the next respin in just a moment

