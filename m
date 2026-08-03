Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C7FF424D47;
	Mon,  3 Aug 2026 17:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785779808; cv=none; b=NOf5DmcOV/1POe5jLtzy+396A9zG3YgTzp9wEShmz2nVLoR+5s1otvuzp5orGFAnOD4C+Z/iksOt66ljYsQs4VQTf+EWfgjkujNoV6+HopOLdgZQJ+WHE+UBFbQ7kOYWG4z4/YH3wvDYmumdVR+9tfOQBWVKmBAg8BjCZF/TqvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785779808; c=relaxed/simple;
	bh=m4vt64u6cJX0WIWdq88CwwkdVG49bKzDv3Dzuhu5MZY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=Q30dQD9MxZvFKgsJMRr3RDaWgDkh/tYZ7QuODqpIqdGYG9yASVRh/NUyLp7ySi4zVr92OMwUuTSxF3L2w0PHm1AmfMIhqAq16YZRdC8OdTfBEiN8BZEnrhN8et+C2kNN7yzxdSYadoQ8EfwTWLG/4krI1oT8nbhtGPI1xBO8WVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YcbQOOmE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YcbQOOmE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 969BF1F00A3A;
	Mon,  3 Aug 2026 17:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785779806;
	bh=0W2dA/tdnG6mWPGo2zM7KT0maUNZ2/vxD3OQ7HNm5g0=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=YcbQOOmEtOpQVHtYFHt/jXOGqQoQngTf+ugzZGePRvRRrYA8DOQsPqvRNLDpi/lzj
	 jz9tFTlvR/UE2Bjl9JKWwTDydTq5SZga+Z8qVRBFNzRWbyMDFN/6lN9uz88qfXbVOS
	 CZ9aL15nY/gzM590dE+d3fVM7iWfbUw+tO6kZbshW0d4gkLxc8zfUlevC+RNiEJlPS
	 YAwiWrvq7LvJxBq2aAkFhj8xHmhvk4Uf5oBvYHKFYYyytz1eC4TbTgCu52KgGasT4+
	 L2H5s32RncX9xZrb/U2tXm9WKdItOazlEDBoJG6F4SwVGCNbY1oV2KR+IFq/0Ovy+m
	 yDPdFyPTb288w==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 03 Aug 2026 19:56:39 +0200
Message-Id: <DKFI3UD0X731.1X9513GWW3LT7@kernel.org>
Subject: Re: [PATCH v2 9/9] drm/debugfs: hold device reference for the
 lifetime of open files
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Tamir Duberstein" <tamird@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, =?utf-8?q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Alexander Viro"
 <viro@zeniv.linux.org.uk>, "Christian Brauner" <brauner@kernel.org>, "Jan
 Kara" <jack@suse.cz>, "Matthew Brost" <matthew.brost@intel.com>,
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, "Melissa Wen"
 <mwen@igalia.com>, "Wambui Karuga" <wambui.karugax@gmail.com>, "Eric
 Anholt" <eric@anholt.net>, "Ben Gamari" <bgamari@gmail.com>,
 <rust-for-linux@vger.kernel.org>, <driver-core@lists.linux.dev>,
 <dri-devel@lists.freedesktop.org>
To: "Alvin Sun" <alvin.sun@linux.dev>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260731-tyr-debugfs-v2-v2-0-aea19eccb996@linux.dev>
 <20260731-tyr-debugfs-v2-v2-9-aea19eccb996@linux.dev>
In-Reply-To: <20260731-tyr-debugfs-v2-v2-9-aea19eccb996@linux.dev>

On Thu Jul 30, 2026 at 7:05 PM CEST, Alvin Sun wrote:
> Hold a device reference (via drm_dev_get/put) across the lifetime of open
> debugfs files. Prevents use-after-free when a device is unregistered whil=
e
> a debugfs file remains open. Both drm_debugfs_open (legacy info_list)
> and drm_debugfs_entry_open (drm_debugfs_add_file) paths are covered.
>
> Fixes: 1c9cacbea8805 ("drm/debugfs: create device-centered debugfs functi=
ons")
> Fixes: 28a62277e06f9 ("drm: Convert proc files to seq_file and introduce =
debugfs")
>
> Signed-off-by: Alvin Sun <alvin.sun@linux.dev>
> ---
>  drivers/gpu/drm/drm_debugfs.c | 42 +++++++++++++++++++++++++++++++++++++=
+----
>  1 file changed, 38 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.=
c
> index 38cf6ce387cc8..5262a708f1602 100644
> --- a/drivers/gpu/drm/drm_debugfs.c
> +++ b/drivers/gpu/drm/drm_debugfs.c
> @@ -159,11 +159,28 @@ static const struct drm_debugfs_info drm_debugfs_li=
st[] =3D {
>  static int drm_debugfs_open(struct inode *inode, struct file *file)
>  {
>  	struct drm_info_node *node =3D inode->i_private;
> +	struct drm_device *dev =3D node->minor->dev;
> +	int ret;
> =20
>  	if (!device_is_registered(node->minor->kdev))
>  		return -ENODEV;
> =20
> -	return single_open(file, node->info_ent->show, node);
> +	drm_dev_get(dev);
> +
> +	ret =3D single_open(file, node->info_ent->show, node);
> +	if (ret)
> +		drm_dev_put(dev);
> +
> +	return ret;
> +}
> +
> +static int drm_debugfs_release(struct inode *inode, struct file *file)
> +{
> +	struct drm_info_node *node =3D
> +		((struct seq_file *)file->private_data)->private;
> +
> +	drm_dev_put(node->minor->dev);
> +	return single_release(inode, file);
>  }

This isn't needed; in drm_dev_unregister() we call debugfs_remove_recursive=
(),
which already waits for all in-flight file operations. The DRM device itsel=
f is
guaranteed to be valid as long as it is registered.
