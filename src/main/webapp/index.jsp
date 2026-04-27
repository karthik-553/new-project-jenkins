<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1" />
    <title>NexusShop — Premium Store</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&family=Playfair+Display:wght@700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        :root {
            --bg: #0a0a0a;
            --card: #121212;
            --text: #f0f0f0;
            --text-muted: #a0a0a0;
            --primary: #00f5ff;
            --accent: #ff2e63;
            --border: rgba(255,255,255,0.08);
            --radius: 16px;
        }

        * { box-sizing: border-box; margin:0; padding:0; }
        body {
            font-family: 'Inter', system_ui, sans-serif;
            background: var(--bg);
            color: var(--text);
            line-height: 1.6;
        }
        .container { max-width: 1280px; margin: 0 auto; padding: 0 20px; }

        header {
            position: sticky; top: 0; z-index: 100;
            background: rgba(10,10,10,0.95); backdrop-filter: blur(20px);
            border-bottom: 1px solid var(--border);
        }
        .header-inner {
            display: flex; align-items: center; justify-content: space-between;
            padding: 18px 0;
        }
        .brand { font-family: 'Playfair Display', serif; font-size: 28px; font-weight: 700; letter-spacing: -1px; }
        .brand .accent { color: var(--primary); }

        .search {
            background: rgba(255,255,255,0.06); border: 1px solid var(--border);
            border-radius: 999px; padding: 10px 20px; display: flex; align-items: center;
            gap: 12px; min-width: 320px;
        }
        .search:focus-within { border-color: var(--primary); }

        .icon-btn {
            background: transparent; border: none; color: var(--text-muted);
            font-size: 22px; cursor: pointer; padding: 8px; border-radius: 50%;
        }
        .icon-btn:hover { color: var(--primary); background: rgba(255,255,255,0.08); }
        .cart-count {
            position: absolute; top: -4px; right: -4px; background: var(--accent);
            color: white; font-size: 11px; font-weight: 700; width: 20px; height: 20px;
            border-radius: 50%; display: grid; place-items: center;
        }

        /* Main Layout */
        .main-content {
            display: flex;
            gap: 32px;
            padding: 40px 0;
        }

        .filters-sidebar {
            width: 280px;
            background: var(--card);
            border: 1px solid var(--border);
            border-radius: var(--radius);
            padding: 24px;
            height: fit-content;
            position: sticky;
            top: 90px;
            align-self: flex-start;
        }

        .filter-section {
            margin-bottom: 32px;
        }
        .filter-section h3 {
            font-size: 16px; margin-bottom: 16px; color: var(--text);
        }

        /* Chips */
        .chips {
            display: flex; flex-wrap: wrap; gap: 8px;
        }
        .chip {
            background: rgba(255,255,255,0.06); border: 1px solid var(--border);
            padding: 6px 14px; border-radius: 999px; font-size: 13px;
            cursor: pointer; transition: all 0.3s;
        }
        .chip.active {
            background: var(--primary); color: #000; border-color: var(--primary);
        }

        /* Color Swatches */
        .color-swatches {
            display: flex; flex-wrap: wrap; gap: 12px;
        }
        .color-option {
            width: 36px; height: 36px; border-radius: 50%;
            cursor: pointer; border: 2px solid transparent;
            transition: all 0.2s;
            position: relative;
        }
        .color-option.active {
            border-color: var(--primary);
            transform: scale(1.15);
        }
        .color-option::after {
            content: attr(data-color);
            position: absolute; bottom: -22px; left: 50%;
            transform: translateX(-50%); font-size: 11px; white-space: nowrap;
            color: var(--text-muted);
        }

        /* Products */
        .products-area { flex: 1; }
        .products-header {
            display: flex; justify-content: space-between; align-items: center;
            margin-bottom: 24px;
        }
        select {
            background: var(--card); color: var(--text); border: 1px solid var(--border);
            padding: 10px 16px; border-radius: 999px;
        }

        .products {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
            gap: 24px;
        }

        .product {
            background: var(--card); border-radius: var(--radius); overflow: hidden;
            border: 1px solid var(--border); transition: all 0.4s;
        }
        .product:hover {
            transform: translateY(-10px);
            box-shadow: 0 25px 50px rgba(0,0,0,0.4);
        }
        .product img {
            width: 100%; height: 260px; object-fit: cover; transition: transform 0.5s;
        }
        .product:hover img { transform: scale(1.08); }

        .product-body { padding: 18px; }
        .product h5 { font-size: 16px; margin-bottom: 8px; }
        .price { font-size: 20px; font-weight: 700; color: var(--primary); }
        .add-btn {
            width: 100%; background: var(--primary); color: black;
            padding: 14px; border: none; border-radius: 12px;
            font-weight: 600; cursor: pointer; margin-top: 12px;
        }

        .btn-clear {
            background: transparent; color: var(--accent); border: 1px solid var(--accent);
            padding: 10px 20px; border-radius: 999px; cursor: pointer;
            margin-top: 20px; width: 100%;
        }

        .hero { min-height: 520px; background: linear-gradient(rgba(10,10,10,0.7), rgba(10,10,10,0.85)), url('https://images.unsplash.com/photo-1556742049-0cfed4f6a45d?auto=format&fit=crop&w=2000&q=80') center/cover; display: flex; align-items: center; }
        .hero h1 { font-family: 'Playfair Display', serif; font-size: 58px; line-height: 1.1; }

        @media (max-width: 992px) {
            .main-content { flex-direction: column; }
            .filters-sidebar { width: 100%; position: static; }
        }
    </style>
</head>
<body>
    <header>
        <div class="container header-inner">
            <div class="brand">Nexus<span class="accent">Shop</span></div>
            <div class="search">
                <i class="fas fa-search"></i>
                <input type="text" id="searchInput" placeholder="Search products...">
            </div>
            <div class="header-actions">
                <button class="icon-btn"><i class="far fa-user"></i></button>
                <button class="icon-btn"><i class="far fa-heart"></i></button>
                <button class="icon-btn cart" id="cartBtn">
                    <i class="fas fa-shopping-cart"></i>
                    <span class="cart-count" id="cartCount">0</span>
                </button>
            </div>
        </div>
    </header>

    <main class="container">
        <div class="main-content">
            <!-- Filters Sidebar -->
            <aside class="filters-sidebar">
                <h2 style="margin-bottom:24px; font-size:20px;">Filters</h2>

                <!-- Categories -->
                <div class="filter-section">
                    <h3>Categories</h3>
                    <div class="chips" id="categoryFilters"></div>
                </div>

                <!-- Brands -->
                <div class="filter-section">
                    <h3>Brands</h3>
                    <div class="chips" id="brandFilters"></div>
                </div>

                <!-- Colors -->
                <div class="filter-section">
                    <h3>Color</h3>
                    <div class="color-swatches" id="colorFilters"></div>
                </div>

                <!-- Price Range -->
                <div class="filter-section">
                    <h3>Price Range</h3>
                    <div style="display:flex; gap:12px; margin-bottom:12px;">
                        <input type="number" id="minPrice" placeholder="Min" value="0" style="width:100%; background:var(--card); border:1px solid var(--border); padding:8px 12px; border-radius:8px; color:var(--text);">
                        <input type="number" id="maxPrice" placeholder="Max" value="3000" style="width:100%; background:var(--card); border:1px solid var(--border); padding:8px 12px; border-radius:8px; color:var(--text);">
                    </div>
                    <input type="range" id="priceSlider" min="0" max="3000" value="3000" style="width:100%;">
                </div>

                <!-- Rating -->
                <div class="filter-section">
                    <h3>Rating</h3>
                    <div id="ratingFilters">
                        <label class="filter-option" style="display:flex;align-items:center;gap:8px;margin-bottom:8px;cursor:pointer;">
                            <input type="checkbox" value="4"> ★★★★ & Up
                        </label>
                        <label class="filter-option" style="display:flex;align-items:center;gap:8px;margin-bottom:8px;cursor:pointer;">
                            <input type="checkbox" value="3"> ★★★ & Up
                        </label>
                    </div>
                </div>

                <button class="btn-clear" id="clearFilters">Clear All Filters</button>
            </aside>

            <!-- Products Area -->
            <div class="products-area">
                <div class="products-header">
                    <div class="results-count">Showing <span id="count">8</span> products</div>
                    <select id="sortSelect">
                        <option value="relevance">Sort: Relevance</option>
                        <option value="price-low">Price: Low → High</option>
                        <option value="price-high">Price: High → Low</option>
                        <option value="rating">Best Rated</option>
                    </select>
                </div>

                <div class="products" id="productsGrid"></div>
            </div>
        </div>
    </main>

    <script>
        // Enhanced Product Data with Brand & Color
        const PRODUCTS = [
            { id: 1, title: "iPhone 14 Pro Max", price: 1099, rating: 5, category: "phones", brand: "Apple", color: "space-gray", img: "https://images.unsplash.com/photo-1601784551446-20c9e07cdbdb?auto=format&fit=crop&w=600&q=80" },
            { id: 2, title: "MacBook Pro 14\"", price: 1999, rating: 4, category: "laptops", brand: "Apple", color: "silver", img: "https://images.unsplash.com/photo-1593642632823-8f785ba67e45?auto=format&fit=crop&w=600&q=80" },
            { id: 3, title: "Apple Watch Series 8", price: 349, rating: 5, category: "accessories", brand: "Apple", color: "midnight", img: "https://images.unsplash.com/photo-1529374255404-311a2a4f1fd9?auto=format&fit=crop&w=600&q=80" },
            { id: 4, title: "Nike Air Max 270", price: 150, rating: 4, category: "footwear", brand: "Nike", color: "black", img: "https://images.unsplash.com/photo-1542272604-787c3835535d?auto=format&fit=crop&w=600&q=80" },
            { id: 5, title: "Sony A7 IV Camera", price: 2499, rating: 5, category: "gadgets", brand: "Sony", color: "black", img: "https://images.unsplash.com/photo-1526170375885-4d8ecf77b99f?auto=format&fit=crop&w=600&q=80" },
            { id: 6, title: "Sony WH-1000XM5", price: 399, rating: 5, category: "gadgets", brand: "Sony", color: "silver", img: "https://images.unsplash.com/photo-1600185365483-26d7a4cc7519?auto=format&fit=crop&w=600&q=80" },
            { id: 7, title: "Chanel No. 5 Perfume", price: 120, rating: 5, category: "accessories", brand: "Chanel", color: "gold", img: "https://images.unsplash.com/photo-1585386959984-a4155224a1ad?auto=format&fit=crop&w=600&q=80" },
            { id: 8, title: "Samsung Galaxy Watch 6", price: 299, rating: 4, category: "accessories", brand: "Samsung", color: "black", img: "https://images.unsplash.com/photo-1523275335684-37898b6baf30?auto=format&fit=crop&w=600&q=80" }
        ];

        // Filter States
        let activeCategories = [];
        let activeBrands = [];
        let activeColors = [];
        let minPriceFilter = 0;
        let maxPriceFilter = 3000;
        let minRatingFilter = 0;
        let currentSort = 'relevance';

        const availableBrands = ["Apple", "Sony", "Nike", "Samsung", "Chanel"];
        const availableColors = [
            { name: "Black", value: "black", hex: "#1a1a1a" },
            { name: "Silver", value: "silver", hex: "#c0c0c0" },
            { name: "Space Gray", value: "space-gray", hex: "#4a4a4a" },
            { name: "Midnight", value: "midnight", hex: "#0a0a0a" },
            { name: "Gold", value: "gold", hex: "#d4af37" }
        ];

        function renderChips(containerId, items, isBrand = true) {
            const container = document.getElementById(containerId);
            container.innerHTML = items.map(item => `
                <div class="chip" data-value="${isBrand ? item : item.value}">
                    ${isBrand ? item : item.name}
                </div>
            `).join('');

            container.querySelectorAll('.chip').forEach(chip => {
                chip.addEventListener('click', () => {
                    const value = chip.dataset.value;
                    const activeArray = isBrand ? activeBrands : activeColors;
                    const index = activeArray.indexOf(value);

                    if (index > -1) {
                        activeArray.splice(index, 1);
                        chip.classList.remove('active');
                    } else {
                        activeArray.push(value);
                        chip.classList.add('active');
                    }
                    applyFilters();
                });
            });
        }

        function renderColorSwatches() {
            const container = document.getElementById('colorFilters');
            container.innerHTML = availableColors.map(color => `
                <div class="color-option" data-color="${color.value}" 
                     style="background-color: ${color.hex};" title="${color.name}"></div>
            `).join('');

            container.querySelectorAll('.color-option').forEach(option => {
                option.addEventListener('click', () => {
                    const colorValue = option.dataset.color;
                    if (activeColors.includes(colorValue)) {
                        activeColors = activeColors.filter(c => c !== colorValue);
                        option.classList.remove('active');
                    } else {
                        activeColors.push(colorValue);
                        option.classList.add('active');
                    }
                    applyFilters();
                });
            });
        }

        function applyFilters() {
            let filtered = PRODUCTS.filter(p => {
                const matchesSearch = !document.getElementById('searchInput').value || 
                    p.title.toLowerCase().includes(document.getElementById('searchInput').value.toLowerCase());

                const matchesCategory = activeCategories.length === 0 || activeCategories.includes(p.category);
                const matchesBrand = activeBrands.length === 0 || activeBrands.includes(p.brand);
                const matchesColor = activeColors.length === 0 || activeColors.includes(p.color);
                const matchesPrice = p.price >= minPriceFilter && p.price <= maxPriceFilter;
                const matchesRating = p.rating >= minRatingFilter;

                return matchesSearch && matchesCategory && matchesBrand && matchesColor && matchesPrice && matchesRating;
            });

            // Sorting
            if (currentSort === 'price-low') filtered.sort((a,b) => a.price - b.price);
            else if (currentSort === 'price-high') filtered.sort((a,b) => b.price - a.price);
            else if (currentSort === 'rating') filtered.sort((a,b) => b.rating - a.rating);

            renderProducts(filtered);
            document.getElementById('count').textContent = filtered.length;
        }

        function renderProducts(list) {
            const grid = document.getElementById('productsGrid');
            grid.innerHTML = list.map(p => `
                <div class="product">
                    <img src="${p.img}" alt="${p.title}">
                    <div class="product-body">
                        <h5>${p.title}</h5>
                        <div style="color:var(--text-muted); font-size:13px;">${p.brand} • ${p.category}</div>
                        <div style="margin:12px 0;">
                            <span class="price">$${p.price}</span>
                        </div>
                        <div style="color:#ffc107;">${'★'.repeat(p.rating)}</div>
                        <button class="add-btn" data-id="${p.id}">Add to Cart</button>
                    </div>
                </div>
            `).join('');

            grid.querySelectorAll('.add-btn').forEach(btn => {
                btn.addEventListener('click', () => {
                    alert(`Added to cart! (Demo)`);
                });
            });
        }

        function initFilters() {
            // Render all filters
            renderChips('categoryFilters', ["phones", "laptops", "accessories", "footwear", "gadgets"], false);
            renderChips('brandFilters', availableBrands, true);
            renderColorSwatches();

            // Search input
            document.getElementById('searchInput').addEventListener('input', applyFilters);

            // Price
            document.getElementById('minPrice').addEventListener('input', e => { minPriceFilter = Number(e.target.value) || 0; applyFilters(); });
            document.getElementById('maxPrice').addEventListener('input', e => { maxPriceFilter = Number(e.target.value) || 3000; applyFilters(); });
            document.getElementById('priceSlider').addEventListener('input', e => {
                maxPriceFilter = Number(e.target.value);
                document.getElementById('maxPrice').value = maxPriceFilter;
                applyFilters();
            });

            // Rating
            document.querySelectorAll('#ratingFilters input').forEach(cb => {
                cb.addEventListener('change', () => {
                    const checked = Array.from(document.querySelectorAll('#ratingFilters input:checked'));
                    minRatingFilter = checked.length ? Math.max(...checked.map(c => Number(c.value))) : 0;
                    applyFilters();
                });
            });

            // Sort
            document.getElementById('sortSelect').addEventListener('change', e => {
                currentSort = e.target.value;
                applyFilters();
            });

            // Clear All
            document.getElementById('clearFilters').addEventListener('click', () => {
                activeCategories = []; activeBrands = []; activeColors = [];
                minPriceFilter = 0; maxPriceFilter = 3000; minRatingFilter = 0;
                document.getElementById('searchInput').value = '';
                document.getElementById('minPrice').value = 0;
                document.getElementById('maxPrice').value = 3000;
                document.getElementById('priceSlider').value = 3000;
                document.querySelectorAll('.chip').forEach(c => c.classList.remove('active'));
                document.querySelectorAll('.color-option').forEach(c => c.classList.remove('active'));
                document.querySelectorAll('input[type="checkbox"]').forEach(c => c.checked = false);
                applyFilters();
            });

            // Initial render
            renderProducts(PRODUCTS);
            document.getElementById('count').textContent = PRODUCTS.length;
        }

        window.onload = initFilters;
    </script>
</body>
</html>
