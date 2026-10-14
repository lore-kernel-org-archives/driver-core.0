Received: from sender5-op-o11.zoho.com (sender5-op-o11.zoho.com [165.173.182.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95F6B63CB
	for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 00:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.182.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791936717; cv=pass; b=kG9PwaYmOJK1/x0qFd8US+a3s9lj28mVyiSqa7fs35U1d1Uc5MHyunOBBnZ2lBBYXqkiEDbzMrNibDZOWB7DSBXJgjUSBCfwMkvGkfhvXpRRe/j0KI0XCQ1nAyQqfsVScWmPo32EBk8nKu8tzW7q/aXMCLrH9X2olluGdykzofk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791936717; c=relaxed/simple;
	bh=TFE7eNVuvgFJKUzhNoVt2fdEGgUgl9qAnfc7UJiQoUw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fJ37YuORUBUY6QSObSSI4X2wVqQMNaVBlJFAOq1b4mQcopFCqEVe9/Y+kBGWEnyCwou2y/0Jj2HDcCmoX1j9F2n+K8hfMaNh9S6YDJY3vEFJu6u9I+/08mWD7pxYAdUlfH9Zuz2CM2UjvH4mQK024IzjaZVWifHRDWxkMywh7AA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b=AFjnC2fx; arc=pass smtp.client-ip=165.173.182.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="AFjnC2fx"
ARC-Seal: i=1; a=rsa-sha256; t=1791936687; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=A5vSWpTRbU3aybI2eZ4bWu31FH9JMEUvPl1dx5fSyhofvK3W8OpljKkSYaK78zCWDgFL3r2OM6ft+wKXk3R67v8IJ3JVQWlI3Wz+9z6nlPCEIk2GYghIM+QUW1WOtdAq5L/619w5bEGHMOe5BSjWYqHm0isecrG1rzra007nc/s=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1791936687; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=31RYT1NeKYC/yx5MWS0uypGHxzMJAgXasfC8mMXP0jU=; 
	b=l8OGgWMFz0yalA9cBHXEzxupyUm0purbkguZeQxHCIsDEOtgbzkvfX71GC1TT9ybz/q56ibzhyUSsWbxYkXY1lNLY6ucP++ULrA8NhG2Pa3n7sgeggv2eDDrypQ6e432gBEQKFFocb0hvOewW8lPGI0pN9jnh2ijmKxQSe2H88Y=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
	dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1791936686;
	s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=31RYT1NeKYC/yx5MWS0uypGHxzMJAgXasfC8mMXP0jU=;
	b=AFjnC2fxNenyy/0OM0XTvcgpC5e4cGZr/A/vDN4Vy2BPywkWgmEkU3EsvwGVlDVx
	Ep0ttlN1eh8/22xHZ7sH2oFMYWlA4cvJ6Bsef5O+W1ueGNxTSJXrNdubaN2HPRMLhb1
	x/HF+IPuSAYQQNvbbRe5ZxbqmEMXSmK8gLuJrW2w=
Received: by smtp.zohomail.com with SMTPS id 179193668404267.12973937554386;
	Tue, 13 Oct 2026 17:11:24 -0700 (PDT)
Date: Tue, 13 Oct 2026 17:11:22 -0700
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Ke Sun <sunke@kylinos.cn>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	rust-for-linux@vger.kernel.org, linux-mm@kvack.org,
	dri-devel@lists.freedesktop.org, driver-core@lists.linux.dev,
	Alvin Sun <alvin.sun@linux.dev>
Subject: Re: [PATCH v3 04/11] drm/tyr: add per-file VM pool
Message-ID: <as7IqjINtIURG4yi@um790>
References: <20260929-tyr-ioctls-v3-0-26955fb111d5@kylinos.cn>
 <20260929-tyr-ioctls-v3-4-26955fb111d5@kylinos.cn>
 <aspyoBHaSaJpMxJv@um790>
 <B20D93F5-4950-4E9C-8E3B-E2DC476DA539@collabora.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <B20D93F5-4950-4E9C-8E3B-E2DC476DA539@collabora.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/291.928.13

On Sat, Oct 10, 2026 at 04:33:32PM -0300, Daniel Almeida wrote:
> Hi Deb,
> 
> I find it unidiomatic to have containers destroy an item if addition fails. A
> more common pattern is to return the item in an error. Something like:
> 
> pub(crate) struct AddError<'drm> {
>     pub(crate) error: Error,
>     pub(crate) vm: Arc<Vm<'drm>>,
> }
> 
> This would not convert automatically to Error, so callers could not simply "?"
> it, they have to handle it:
> 
> pool.add(vm).map_err(|e| {
>     e.vm.kill();
>     e.error
> })?;

Interesting, I see what you mean because it would give the caller control
over the vm and managing its tear down. And it would be nice to separate
the creation of the vm from inserting it into the pool. I implemented this
myself and that's fine if you want to go with adding a custom VmAddError
or something like that.

But, would you also consider going the other way and actually creating
the vm inside VmPool::add()?

One advantage of this approach is that we don't have to create the vm at
all if there are no ids available so we can just return ENOSPC.

And, since we have to kill a prev_vm if store unexpectedly returns a vm,
then this would centralize vm creation, registration, and failure cleanup
all in a single place. It would also be consistent with planned revisions
to VmPool::remove() which is going to take responsibility for tearing
down the vm.

> 
> Don't worry, I plan to remove the need to manually call kill() soon, so this
> subject will become outdated in the near future.
> 
> Paths where the Vm is already in the pool can call kill() though, this includes
> remove().
> 
> -- Daniel
