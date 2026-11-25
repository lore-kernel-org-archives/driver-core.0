Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795632613;
	b=mFms145nxxi3/y62sZftM8qGx9s4oJKxXYnk8mr5onOyRy/vOE352Pp3fmCuFgT7KBwU
	 nhWj7WMxsbnUBiuemu+4JOc1mGq+V8F7EmcnQToINehOQzgpKDwqkNYaOg5MlLAuqSw6v
	 I2BRLGkGH5uazy+pe8CP3xLLDlBFAfrBZFZaS4Q8FiJN/wxE/2GU8HUTBBwk85f5yHHGL
	 BDdmLy1gNKtNqyv3siAFDfesA2O0cUhAJ4PY+IeqPt0XGeLDQl4wBqzvZFJnaIdi/Zhsh
	 7+/rpIP8sMrJVhMYq0sXie80f3YPvt1c7s32Kp8igNyf0UWUDIF0WvBCAg4nlw/9cGw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795632613;
	h=DMARC-Filter:DKIM-Signature:Received:Content-Type:Mime-Version:
	 Subject:From:In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:
	 References:To:X-Mailer:X-ZohoMailClient;
	bh=T4QJdIAnF8cgQyJ1JK7OVxMUlUSq0t75T8bZ0NcrZTs=;
	b=RryVKaTXu+IxOuhIs8FbKzqczOHAdMxMrQ+gbbbNA/CrXT/3JKUTOzfGbmlNkQOJTV3z
	 5wUycr7EzPTnDh6mz1qTem8v8xUGoIDPgH3P77yDcJWui1Xt/AAgZjwpJXupGMB4ZhUTj
	 OLH23lXOVY+JJeOWp6JCVq9dcMygLy/VC7gu1uDOsV95UwUpW9sRns3ZDHaqv3OsTjw/j
	 W6b4SzFSqaMulPRUt5/WWnqxjhrmxhCPHDpruAEUX9Gk69hPT3xr752G1ZWIEyGuupYB6
	 lOY2vmDfxy9T7Aacg70EmdOH6wkBawwYV3CES/RxzR6MQA8Yql2S6Z5oO8tpPEk84iw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=KcklkUXa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.11
Received: from sender5-op-o11.zoho.com (sender5-op-o11.zoho.com [165.173.182.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A7D0606A31E
	for <driver-core@lists.linux.dev>; Wed, 25 Nov 2026 18:50:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A7D0606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=KcklkUXa
ARC-Seal: i=1; a=rsa-sha256; t=1795632593; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Q/vgguqfpuRFU9tNviYG3WPmTeozjtgKRbqw3UxCbx+6KPKCBjKSONfzeVE6/rw7aMd78gt41KW+6J9uXuMg6Z84F6EOjBPddD0Jg8b6RCxIRo5MrrJ+eynrMlDriRIoG9U71ypZw5HwNt0+Y1Zgbr6I8jI9fpF1V7jN4IFsUWU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795632593; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=T4QJdIAnF8cgQyJ1JK7OVxMUlUSq0t75T8bZ0NcrZTs=; 
	b=Fd0AShZ0UNNMo8EozlE1i8uEmJ+YgOtfBZiVdMyD1CkXmYecx5D5qRpdmn2oXr5xf6NolXK7WOvK6M/xJ9tgLA2dI0DuCpwRsq7bIAGas7SRXg6lBy8Qqppd/p5UPciNU7zmoA3qvwwOTOJortpbz1ROBEDIitcva7GOHdD+i5k=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: a=rsa-sha256; b=KcklkUXa+vK/5d3ehydqeO09yLe3wAnSUn7X6Hvwmz/Z1uZesaddCSn2u/vritIVGyGYhkKbTvBsqv639gKPAqxqMK4Usb4OPyKC1xNCY0xshVX1A/bHC/gKHhXe7re8a5/CWsemLQeT40nU0wIasYrrK5nkqQP/xqBhzAT5OaE=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=T4QJdIAnF8cgQyJ1JK7OVxMUlUSq0t75T8bZ0NcrZTs=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 179563259167510.752161362890206;
	Wed, 25 Nov 2026 10:49:51 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.200.71.1.16\))
Subject: Re: [PATCH v7 07/10] drm/tyr: add VM-related ioctls
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20261122-tyr-ioctls-v7-7-3a2af624b992@linux.dev>
Date: Wed, 25 Nov 2026 15:49:31 -0300
Cc: Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 Tamir Duberstein <tamird@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 =?utf-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 Lyude Paul <lyude@redhat.com>,
 David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Johan Hovold <johan@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>,
 rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 driver-core@lists.linux.dev,
 Ke Sun <sunke@kylinos.cn>
Content-Transfer-Encoding: quoted-printable
Message-Id: <2395489A-A2DD-4740-818D-60636E5CA872@collabora.com>
References: <20261122-tyr-ioctls-v7-0-3a2af624b992@linux.dev>
 <20261122-tyr-ioctls-v7-7-3a2af624b992@linux.dev>
To: Alvin Sun <alvin.sun@linux.dev>
X-Mailer: Apple Mail (2.3901.200.71.1.16)
X-ZohoMailClient: External

Hi Alvin, thanks for working on this! :)

For v8:

Please rebase on drm-rust-next and list these two series as
dependencies:

=
https://lore.kernel.org/all/20261124-rust-drm-gem-shmem-imported-sgt-v2-0-=
000f7a9ccb8d@jannau.net/

=
https://lore.kernel.org/all/20261117-tyr-remap-2mb-v1-0-2a8efd4c8180@googl=
e.com/

Please switch the ops array to KVVec, as Deborah suggested:
https://lore.kernel.org/all/awYgh-A8JtN899eB@um790/

Please do not add new "as=E2=80=9D casts unless absolutely needed. =
from_safe_cast(),
UserPtr::from_u64() and cv!() for the uAPI constants cover all but
VM_BIND_OP_TYPE_MASK. For this last one, please use a //CAST: comment


> On 22 Nov 2026, at 09:50, Alvin Sun <alvin.sun@linux.dev> wrote:
>=20
> Implement VM_CREATE, VM_DESTROY, VM_BIND and VM_GET_STATE. VM_CREATE
> hands the new VM to the per-file pool and, on insertion failure, the
> caller tears it down, so an aborted creation never leaks a VM.
> VM_DESTROY removes the VM from the pool and kills it, even if =
in-flight
> jobs still hold references (matching panthor: such jobs are expected

There is no way to have in-flight jobs or any jobs running at the =
moment, so I
would drop this part.

> to fault). VM_BIND runs synchronously for now.
>=20
> Signed-off-by: Alvin Sun <alvin.sun@linux.dev>

Same comment as previously regarding the commit message.

Here is what I would write, as a mere example:

---
drm/tyr: add VM-related ioctls

Currently, the only VM in Tyr is the one the MCU runs in, and userspace
has no way to create one.

Add the four VM ioctls of the panthor uAPI:

- VM_CREATE creates a user VM and adds it to the VM pool of the file.
- VM_DESTROY removes a VM from the pool and kills it.
- VM_BIND maps/unmaps BO ranges into a VM.
- VM_GET_STATE reports whether a VM is usable.

VM_BIND is synchronous only. DRM_PANTHOR_VM_BIND_ASYNC fails with
EOPNOTSUPP.

=E2=80=94

Note how this says _why_ the change is needed, not only what the change =
does:

Currently, the only VM in Tyr is the one the MCU runs in, and userspace
has no way to create one.

=E2=80=94 Daniel

